####### module #######
module "fastapi_server_host" {
    source = "./fastapi_server_module_host"

    ami_id          = "ami-00eb69d236edcfaf8"
    instance_type   = "t2.micro"
    server_name     = "fastapi_server_host"
    enviroment      = "devOps"
    subred_name     = "subnet-05cdeaa81fa6741c2"
    sg_name         = "sg-0524ac082ab240c4b"
}

module "fastapi_server_client" {
    source          = "./fastapi_server_module_client"

    ami_id          = "ami-00eb69d236edcfaf8"
    instance_type   = "t2.micro"
    server_name     = "fastapi_server_client"
    enviroment      = "devOps"
    subred_name     = "subnet-0a2c30abea425cb37"
    sg_name         = "sg-0d02c7fd78842b307"
}


####### output #######
output "fastapi_host_ip" {
    description = "Dirección IP pública de la instancia EC2"
    value       = module.fastapi_server_host.server_public_ip
}

output "fastapi_host_dns" {
    description = "DNS público de la instancia EC2"
    value       = module.fastapi_server_host.server_public_dns
}


output "fastapi_client_dns" {
    description = "DNS público de la instancia EC2"
    value       = module.fastapi_server_client.server_public_dns
}