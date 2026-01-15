resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing ssh access"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0 #all ports
        to_port = 0
        protocol = "-1" #all protocols
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
      Name = "allow_ssh"
      Createdby = "terraform"
    }
  
}

resource "aws_instance" "db" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = {
      Name = "DB"
      Createdby = "terraform"
    }
}