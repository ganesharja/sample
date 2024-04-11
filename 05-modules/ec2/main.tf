# Create Ec2 
resource "aws_instance" "moapp" {
  ami                       = "ami-0081f769161bc01f5"
  instance_type             = "t3.medium"
  vpc_security_group_ids    = [var.sg]
#   key_name                  = "730AM"

  tags = {
    Name = "Module-Instance"
  }
}

variable "sg" {}