
resource "aws_instance" "nodes" {
    count = var.nodes_count
    //name = var.ubuntu_server-name+"-${count.index}"

    ami           = var.ubuntu_server-ami
    instance_type = var.ubuntu_server-instance_type
    tags          = { Name = "${var.ubuntu_server-name}-${count.index}" }
    vpc_security_group_ids = [aws_security_group.web_server-security.id]
    key_name = var.key_name

    lifecycle {
        create_before_destroy = true
    }

}


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

// outputs

/*
output "nodes-ips" {
  value = google_compute_instance.nodes.*.network_interface.0.access_config.0.nat_ip
}
*/
output "ubuntu-server_ip_address" {
  value = aws_instance.nodes.*.public_ip
}