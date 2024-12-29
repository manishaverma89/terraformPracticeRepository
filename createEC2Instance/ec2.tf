resource "aws_instance" "web" {
  ami           = ami-0ca9fb66e076a6e32
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}