
// aws_instances

resource "aws_instance" "amazon_linux" {
  ami           = var.amazon_linux-ami
  instance_type = var.amazon_linux-instance_type
  tags          = { Name = "amazon linux" }
  vpc_security_group_ids = [aws_security_group.web_server-security.id]
  key_name = "dipl"
}

resource "aws_instance" "ubuntu_server" {
  ami           = var.ubuntu_server-ami
  instance_type = var.ubuntu_server-instance_type
  tags          = { Name = "ubuntu server" }
  vpc_security_group_ids = [aws_security_group.db_server-security.id]
  key_name = "dipl"
}

resource "aws_instance" "jenkins_ubuntu" {
  ami           = var.ubuntu_server-ami
  instance_type = var.ubuntu_server-instance_type
  tags          = { Name = "jenkins ubuntu" }
  vpc_security_group_ids = [aws_security_group.web_server-security.id]
  key_name = "dipl"
}