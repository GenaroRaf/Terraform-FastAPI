####### ssh_key #######
#ssh-keygen -t rsa -b 2048 -f "fastapi_server_host.key"

resource "aws_key_pair" "fastapi-server-host-ssh"{
    key_name    = "${var.server_name}-ssh"
    public_key  = file("${var.server_name}.key.pub")

    tags = {
        Name       = "${var.server_name}-ssh"
        Enviroment = var.enviroment
        Owner      = "${var.owner_project}"
        Team       = "${var.team_project}"
        Project    = "${var.project_name}"
    }
}