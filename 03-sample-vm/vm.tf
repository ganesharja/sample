resource "aws_instance" "app" {
  # ami                       = "ami-0e977b99c38a13dfc"
  ami                       = "ami-0081f769161bc01f5"
  instance_type             = "t3.medium"
  vpc_security_group_ids    = [aws_security_group.allow_ssh.id]
#   key_name                  = "730AM"

  tags = {
    Name = "Terraform-Instance"
  }
}

output "private_ip_address" {
  value = aws_instance.app.private_dns
}

# Creates Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from Internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}