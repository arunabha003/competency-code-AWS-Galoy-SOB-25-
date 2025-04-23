resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"     # change to your desired instance size


  tags = {
    Name = "first-ec2-instance"
  }
}
