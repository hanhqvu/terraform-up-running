provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08e32db9e33e28876"
  instance_type = "t2.nano"
}
