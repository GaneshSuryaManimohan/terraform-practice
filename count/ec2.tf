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

resource "aws_instance" "ec2" {
    #count = 3
    count = length(var.instance_name)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    # tags = {
    #   Name = var.instance_name[count.index]
    # } 
}