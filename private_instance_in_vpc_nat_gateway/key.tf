resource "aws_key_pair" "my_key" {
  key_name = "mytf-key"
  public_key = tls_private_key.rsa.public_key_openssh
}


resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

#Private key is stored in local file
resource "local_file" "TF-key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}