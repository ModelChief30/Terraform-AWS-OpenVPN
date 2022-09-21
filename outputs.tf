output "public_ip" {
  value = "Public IP Address: ${aws_instance.example.public_ip}"
}

output "public_dns" {
    value = "Public DNS: ${aws_instance.example.public_dns}"
}