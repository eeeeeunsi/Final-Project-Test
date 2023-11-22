################################################################################
# Bastion Instance
################################################################################
module "jp-bastion" {
  source        = "./module/ec2"
  instance_name = "bastion"

  instance_type   = "t3.small"
  security_groups = [aws_security_group.bastion_sg.id]

  subnet_id                   = module.jp-prd-vpc.public_subnets_ids["subnet_a1"]
  associate_public_ip_address = true
  key_name                    = "test"

  user_data = file("./mgmt_setup.sh")
}

################################################################################
# Bastion SG
################################################################################
resource "aws_security_group" "bastion_sg" {
  vpc_id = module.jp-prd-vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}