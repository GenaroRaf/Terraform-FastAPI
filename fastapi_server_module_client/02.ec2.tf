####### resource #######
resource "aws_instance" "fastapi-server-client" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = var.subred_name
    vpc_security_group_ids = ["${var.sg_name}"]

    #asigno un valor a una variable apartir de otro recurso
    key_name = aws_key_pair.fastapi-server-client-ssh.key_name 

    tags = {
        Name        = var.server_name
        Enviroment  = var.enviroment
        Owner       = "${var.owner_project}"
        Team        = "${var.team_project}"
        Project     = "${var.project_name}"
    }
}
