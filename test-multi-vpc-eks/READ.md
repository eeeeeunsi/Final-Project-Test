
### How to use this terraform code


1. terraform code 실행  

```sh
terraform init
terraform apply -auto-approve
```
  
2. mgmt-vpc에 생성된 instance ip 확인 후, bastion -> mgmt로 접근  

3. user_data 로 install된 package 확인  
```sh
aws --version
kubectl version
eks version
helm version
```  
  
4. aws cli access  
```sh
aws configure
# 자신의 access-key, password 입력
# 해당 code 에서는 tf-user를 사용하고 있음
aws sts get-caller-identity

# 필요에 따라 tf-user profile 추가
aws configure --profile tf-user
```  
  
5. eks cluster에 접근  
```sh
aws eks update-kubeconfig --region ap-northeast-2 --name {cluster-name}
# 확인
kubectl get no -o wide
kubectl get all
```

6. alb-ingress-controller.sh 다운로드 및 설치  
[alb-ingress-controller.sh]()
```sh
chmod +x alb-ingress-controller.sh
# 실행 전에 cluster name 변경해주기!
./alb-ingress-controller.sh
```