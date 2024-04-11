# Datasource to fetch the info of AMI
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "b55_ansible_image_WS"
  owners           = ["self"]
}


resource "aws_instance" "web" {
  # ami                       = "ami-0e977b99c38a13dfc"
  count                     =var.howManyYouWant
  ami                       = aws_ami.ami.image_id
  instance_type             = "t3.medium"

  tags = {
 
    Name = "Terraform-web-Instance-${count.index+1}"
  }
}