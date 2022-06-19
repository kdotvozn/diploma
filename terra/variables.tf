

variable "region" {
  //default = "eu-north-1"
}

variable "access_key" {
}
variable "secret_key" {
}


variable "key_name" {
  default =  "dipl"
}

variable "ubuntu_server-name" {
}

variable "nodes_count" {
  //default = 2
}

variable "ubuntu_server-ami" {
  type = string
  default = "ami-0ff338189efb7ed37" # Ubuntu Server 20.04 LTS, SSD Volume Type
}

variable "ubuntu_server-instance_type" {
  type = string
  default = "t3.micro"
}

variable "web_server-allowed_ports" {
  type = list(number)
  default = [22, 53, 80, 443, 8080]
}


