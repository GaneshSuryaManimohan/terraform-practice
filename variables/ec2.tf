resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_desc
    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = var.allowed_cidr
    }

    egress {
        from_port = 0 #all ports
        to_port = 0
        protocol = "-1" #all protocols
        cidr_blocks = var.allowed_cidr
    }

    tags = {
      Name = "allow_ssh"
      Createdby = "terraform"
    }
  
}

resource "aws_instance" "db" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = var.tags
}