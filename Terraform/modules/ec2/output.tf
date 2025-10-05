output "instance_ids" {
    value = aws_instance.web-server[*].id
}
output "public_ips" {
    value = aws_instance.web-server[*].public_ip
}