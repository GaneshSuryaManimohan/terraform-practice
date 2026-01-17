variable "instance_name" {
  type = map(string)
  default = {
    db = "t3.small"
    backend = "t3.small"
    frontend = "t3.micro"
  }
}

variable "domain_name" {
  default = "surya-devops.site"
}

variable "zone_id" {
  default = "Z0312601O3LJV4TYIONT"
}