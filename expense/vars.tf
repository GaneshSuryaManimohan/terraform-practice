#1. command line variables
#2. tfvars
#3. ENV variables
#4. variable default value

variable "ami_id" {
  type = string
  default = "ami-0220d79f3f480ecf5"
  description = "RedHat-9 Image ID"
}

variable "instance_name" {
  type = list(string)
  default = [ "db", "backend", "frontend" ]  
}

# variable "instance_type" {
#   default = "t3.micro"
#   type = string
# }

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

variable "common_tags" {
  default = {
    Project = "Expense"
    Environment = "Dev"
    CreatedBy = "Terraform"
  }
}

variable "zone_id" {
    default = "Z0312601O3LJV4TYIONT"
}

variable "domain_name" {
  default = "surya-devops.site"
}