# 필요한 변수 설정 - EKS 클러스터 이름변경 필요!!!
EKS_CLUSTER_NAME="EKS_CLUSTER_NAME"
AWS_REGION="ap-northeast-2"
IAM_OIDC_PROVIDER=$(aws eks describe-cluster --name $EKS_CLUSTER_NAME --query "cluster.identity.oidc.issuer" --output text | sed -e "s/^https:\/\///")

# IAM OIDC ID 제공자를 생성하고 EKS 클러스터에 연결
eksctl utils associate-iam-oidc-provider --region=$AWS_REGION --cluster=$EKS_CLUSTER_NAME --approve

# AWS ALB Ingress Controller에 필요한 IAM 정책을 생성
curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json

# IAM 서비스 계정 생성
eksctl create iamserviceaccount \
  --region $AWS_REGION \
  --name aws-load-balancer-controller \
  --namespace kube-system \
  --cluster $EKS_CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):policy/AWSLoadBalancerControllerIAMPolicy \
  --approve

# AWS ALB Ingress Controller를 설치
kubectl apply -k "https://github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
helm repo add eks https://aws.github.io/eks-charts
helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=$EKS_CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  -n kube-system

# alb controller 설치 확인
kubectl get deployment -n kube-system aws-load-balancer-controller
