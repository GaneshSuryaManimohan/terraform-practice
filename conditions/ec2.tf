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
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.allowed_cidr
  }
}

resource "aws_instance" "db" {
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro" #if instance name is db then t3.small will be created else t3.micro will be created
    tags = var.tags  
}