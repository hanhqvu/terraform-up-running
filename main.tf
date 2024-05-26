provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-08e32db9e33e28876"
  instance_type   = "t2.nano"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, Mom" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
