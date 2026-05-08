resource "aws_instance" "this" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

resource "aws_security_group" "this" {
  count = var.create_sg ? 1 : 0 
}