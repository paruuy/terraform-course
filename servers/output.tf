output "ip_address" {
  value = "${aws_instance.web[*].public_ip}" # aws_instance  e web e declarado no ec2.tf no resource. O [*] e caso estiver criando mais d euma instancia 
}
