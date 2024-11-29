####### output #######
output "server_public_dns"{
    description = "DNS público de la instancia EC2"
    value       = aws_instance.fastapi-server-client.public_dns
}
