output "instance_ip"{
	description = "DNS IP"
        value = "aws_instance.default.pulic_dns"
}
