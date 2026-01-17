resource "aws_instance" "ec2" {
    for_each = var.instance_name
    ami = "ami-0220d79f3f480ecf5"
    vpc_security_group_ids = ["sg-0bbdd2b154434fbfd"]
    instance_type = each.value
    tags = {
      Name = each.key
      Createdby = "terraform"
    }
}