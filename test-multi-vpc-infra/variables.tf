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