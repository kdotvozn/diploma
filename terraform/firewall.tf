// aws_security_groups

resource "aws_security_group" "web_server-security" {
  name        = "web_server_security"
  description = "Allow access for Geocitizen"

  dynamic "ingress" {
    for_each = var.web_server-allowed_ports
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all ingress ports"
    }
  }
}

resource "aws_security_group" "db_server-security" {
  name        = "db_server_security"
  description = "Allow PostgreSQL"

  dynamic "ingress" {
    for_each = var.db_server-allowed_ports
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all ingress ports"
    }
  }
}
