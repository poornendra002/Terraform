
locals {
  ami = "ami-0597375488017747e"
}

resource "aws_instance" "instance1" {
  ami           = local.ami
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "Terraform"
  }
}
resource "aws_instance" "instance2" {
  ami           = local.ami
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "Terraform"
  }
}
resource "aws_instance" "instance1" {
  ami           = local.ami
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "Terraform"
  }
}
