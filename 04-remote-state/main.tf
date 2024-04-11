# Datasource to fetch the info of AMI
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "b55_ansible_image_WS"
  owners           = ["self"]
}


resource "aws_instance" "web" {
  # ami                       = "ami-0e977b99c38a13dfc"
  count                     =length(var.instances)
  ami                       = data.aws_ami.ami.image_id
  instance_type             = "t3.medium"

  tags = {
 
    Name = "${var.instances[count.index]}"
  }
}


variable "instances" {
    default = ["cart", "catalouge", "user"]
}

output "private_ip_address" {
  value = aws_instance.web.*.private_dns
}