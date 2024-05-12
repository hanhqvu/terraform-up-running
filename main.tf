provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-031f17480400af0e5"
  instance_type = "t2.micro"
}
