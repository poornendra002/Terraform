resource "null_resource" "file_copy" {
    connection {
        type = "ssh"
        user = var.ec2_user
        agent = false
        host = "${var.ec2_public_ip}"
        private_key = file("keys/devopslearning.pem")
    }

    provisioner "file" {
        source      = "conf/test.txt"
        destination = "/home/ubuntu/test.txt"
    }

}

# when we mention agent false, no need to provide prompt. It doesn't ask for yes.
#The above shown is two ways of meantioning the variables
