####### resource #######
resource "aws_instance" "fastapi-server-host" {
    ami                    = var.ami_id
    instance_type          = var.instance_type
    subnet_id              = var.subred_name
    vpc_security_group_ids = ["${var.sg_name}"]
    associate_public_ip_address = true  # Asigna una IP pública automáticamente

    user_data = <<-EOF
              #!/bin/bash
              # Actualizar los paquetes del sistema
              sudo apt-get update -y
              sudo apt-get upgrade -y

              # Instalar Python 3 y pip
              sudo apt-get install -y python3 python3-pip

              # Instalar Docker
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              
              # Crear un directorio para el proyecto
              mkdir -p /home/user/codaf/FastAPI-Proyect

              #Descargar repositorio de github
              sudo apt-get install -y git
              sudo git clone link_repositorio_token /home/ubuntu/FastAPI-Proyect

              # Instalar librerias de python
              pip3 install -r /home/user/codaf/FastAPI-Proyect/requirements.txt

              # Iniciar FastAPI (puedes omitir este paso si prefieres iniciar el servidor manualmente)
              # uvicorn /path/to/app:app --host 0.0.0.0 --port 80            
              EOF

    #asigno un valor a una variable apartir de otro recurso
    key_name = aws_key_pair.fastapi-server-host-ssh.key_name 

    tags = {
        Name       = var.server_name
        Enviroment = var.enviroment
        Owner      = "${var.owner_project}"
        Team       = "${var.team_project}"
        Project    = "${var.project_name}"
    }
}
