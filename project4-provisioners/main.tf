module "ec2_create" {
    source = "./modules/ec2"
    ec2_ami = "ami-0597375488017747e"
    ec2_instance_type = "t2.micro"
    ec2_pem = "devopslearning"
}

module "ec2_file_copy_provisioner" {
    source = "./modules/file"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "ec2_remote_exec_provisioner" {
    source = "./modules/remote-exec"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "ec2_local_exec_provisioner" {
    source = "./modules/local-exec"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

#Do not hardcode these values, better to write them in variables.tf
