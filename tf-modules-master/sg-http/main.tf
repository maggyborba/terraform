# Custom Security group - SSH
resource "aws_security_group" "tf-sg-http" {
  name        = "tf-sg-http"
  description = "Terraform created - Allow http/https inbound traffic"
  vpc_id      = "${var.sg_vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-sg-http"
  }
}