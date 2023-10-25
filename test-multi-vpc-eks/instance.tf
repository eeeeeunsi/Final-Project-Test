#######################
# Bastion instance
#######################
resource "aws_instance" "bastion" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = var.bastion_intance_type
  security_groups = [aws_security_group.bastion_sg.id]

  subnet_id                   = module.mgmt-vpc.public_subnets_ids[0]
  associate_public_ip_address = true
  key_name                    = var.bastion_key_name

  tags = {
    Name = "bastion"
  }

  depends_on = [ 
    module.prd-eks, 
    module.staging-eks 
  ]
}

resource "aws_security_group" "bastion_sg" {
  vpc_id = module.mgmt-vpc.vpc_id
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
#######################
# Mgmt instance
#######################
resource "aws_instance" "mgmt" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = var.mgmt_intance_type
  security_groups = [aws_security_group.mgmt_sg.id]

  subnet_id                   = module.mgmt-vpc.public_subnets_ids[0]
  associate_public_ip_address = false
  key_name                    = var.mgmt_key_name

  user_data = file("./mgmt_setup.sh")

  tags = {
    Name = "mgmt"
  }

  depends_on = [ 
    module.prd-eks, 
    module.staging-eks 
  ]
}

resource "aws_security_group" "mgmt_sg" {
  vpc_id = module.mgmt-vpc.vpc_id
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}