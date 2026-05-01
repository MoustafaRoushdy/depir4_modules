resource "aws_instance" "this" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

variable "subnet_id" {
  
}
variable "instance_ami" {
  
}

variable "instance_type" {
  default = "t3.nano"
}


output "instance_public_ip" {
  value = aws_instance.this.public_ip
}