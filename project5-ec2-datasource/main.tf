data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["self"]
     
  filter {
    name   = "tag:Name"
    values = ["my-test-instance"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }   
}

resource "aws_instance" "ec2_provisioner" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.ec2_instance_type
    key_name = var.ec2_pem
    vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
    tags = {
        Name = "PROVISIONER"
    }
}

resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "Allow ssh and http"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

#The "most_recent" argument is a boolean value that is used in some data sources to specify whether to return the most recent version of the requested data.

#If "most_recent = true" is set in the data source block, Terraform will fetch the most recent version of the data from the specified source. 
#If set to "false", Terraform will fetch the data as it existed at the time the last Terraform operation was performed.

#A filter block is a type of block used in data processing that is designed to filter out certain elements of a dataset based on specific criteria. 
#This can include filtering out rows or columns that contain certain values, or removing duplicates from a dataset. When used with a data block, 
#the filter block can be used to pre-process the data before it is passed on to other blocks for further analysis or visualization. 
#Filter blocks are often used in data pipelines and workflows to ensure that the data is clean and accurate before it is used for other purposes.
