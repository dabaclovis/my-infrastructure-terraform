terraform {
  required_version = ">=1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5"
    }
  }

}
provider "aws" {
  profile = "default"
}

resource "aws_instance" "demo-ubuntu" {
  ami           = "ami-0f30a9c3a48f3fa79"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/install.sh")
  key_name = "terraformkeypair"
  subnet_id = aws_subnet.practice-bic-subnet.id 
    vpc_security_group_ids = [ aws_security_group.practiceb-security-group.id  ]
    count = 2
  tags = {
    Name = "demo-ubuntu~${count.index}"
  }
}
