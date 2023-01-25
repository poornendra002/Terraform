resource "aws_instance" "instance1" {
  ami           = "ami-0597375488017747e"
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "Terraform"
  }
}
