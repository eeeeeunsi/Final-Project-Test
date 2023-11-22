
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
- multi-eks 를 관리하기 위해서는 2개의 cluster 모두 등록해주어야 함  
```sh
aws eks update-kubeconfig --region ap-northeast-2 --name common-eks
aws eks update-kubeconfig --region ap-northeast-2 --name prd-eks

# kubectl을 통해 확인
kubectl config get-contexts
# 현재 접속중인 cluster 확인
kubectl config current-context
# 접속할 cluster 변경
kubectl config use-context {eks cluster arn}
```  
  
- eks 를 쉽게 관리하기 위한 **k9s** tool 설치 (option)  
```sh
mkdir k9s; cd k9s
wget https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
tar zxvf k9s_Linux_x86_64.tar.gz
sudo mv k9s /usr/local/bin/k9s
# 실행
k9s
```  
  