variable "region" {
  description = "The name of the AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "credential_files" {
  description = "The file path of the AWS Credentials"
  type        = list(string)
  default     = ["C:/Users/admin/.aws/credentials"]
}

variable "profile" {
  description = "The user name of the AWS Credentials"
  type        = string
  default     = "tf-user"
}

variable "bastion_intance_type" {
  description = "The instance type for bastion"
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_name" {
  description = "Name of the SSH keypair to use in AWS."
  type        = string
  default     = "test"
}

variable "mgmt_intance_type" {
  description = "The instance type for bastion"
  type        = string
  default     = "t3.small"
}

variable "mgmt_key_name" {
  description = "Name of the SSH keypair to use in AWS."
  type        = string
  default     = "test"
}

variable "image_id" {
  description = "The image id of AMI using EC2"
  type = string
   default = ""
}

variable "eks_node_intance_type" {
  description = "The instance type for eks node"
  type        = string
  default     = "t2.micro"
}
