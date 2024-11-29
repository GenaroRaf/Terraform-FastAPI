#variables
variable "ami_id" {
    description = "ID de la AMI para la instancia EC2"
    default     = "ami-00eb69d236edcfaf8"
}

variable "instance_type" {
    description = "Tipo de instancia"
    default     = "t2.micro"
}

variable "server_name" {
    description = "Nombre del servidor web"
    default     = "fastapi-server-client"
}

variable "enviroment" {
    description = "Ambiente de la aplicación"
    default     = "test"
}

variable "owner_project" {
    description = "Propietario del proyecto"
    default     = "codafgamer@gmail.com"
}

variable "team_project" {
    description = "Equipo de trabajo asigando para el proyecto"
    default     = "DevOps"
}

variable "project_name" {
    description = "Nombre del proyecto"
    default     = "Terraform test"
}

variable "subred_name" {
    description = "Nombre de la subred que se elegirá para la instancia"
    default     = "subnet-0a2c30abea425cb37"
}

variable "sg_name" {
    description = "Grupo de seguridad para el client"
    default     = "sg-0d02c7fd78842b307"
}
