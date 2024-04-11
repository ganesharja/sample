resource "aws_instance" "app" {
  # ami                       = "ami-0e977b99c38a13dfc"
  count                     =var.howManyYouWant
  ami                       = "ami-0081f769161bc01f5"
  instance_type             = "t3.medium"

  tags = {
    Name = "Terraform-web-Instance-${count.index}"
  }
}