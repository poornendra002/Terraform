output "ec2_ip" {
			     value = aws_instance.instance1.public_ip	 	
           sensitive = true
}
output "ec2_dns" {
			     value = aws_instance.instance1.public_dns	 	
}
