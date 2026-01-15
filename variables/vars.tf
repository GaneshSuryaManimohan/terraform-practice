#1. command line variables
#2. tfvars
#3. ENV variables
#4. variable default value

variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
  description = "RedHat-9 Image ID"
}

variable "instance_type" {
  default = "t3.micro"
  type = string
}

variable "tags" {
  default = {
    Project = "Expense"
    Environment = "Dev"
    Module = "DB"
    Name = "DB"
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_desc" {
  default = "allowing ssh access"
}

variable "ssh_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "allowed_cidr" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}
