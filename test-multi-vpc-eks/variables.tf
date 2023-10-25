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
  type = string
  default = "t2.micro"
}

variable "bastion_key_name" {
  description = "Name of the SSH keypair to use in AWS."
  type = string
  default = "test"
}

variable "mgmt_intance_type" {
  description = "The instance type for bastion"
  type = string
  default = "t2.micro"
}

variable "mgmt_key_name" {
  description = "Name of the SSH keypair to use in AWS."
  type = string
  default = "test"
}
