# --------------------------------------------------------------------------------------------------------------------------
# This demo template launches an AWS EC2 instance with a websevber serving a simple index.html page showing "Hello Technet"
# --------------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 4.0"
    }
  }
}

# ------------------------------------------------------------------------------
# Select the aws region where the instance will be launched
# ------------------------------------------------------------------------------
provider "aws" {
  region = "us-west-2"
}

# -------------------------------------------------------------------------------
# Deploy a EC2 instance
# -------------------------------------------------------------------------------

resource "aws_instance" "terraform-demo" {
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type in us-west-2
  ami                    = "ami-0b152cfd354c4c7a4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello Technet" > index.html
                nohup busybox httpd -f -p "8080" &
                EOF

  tags = {
    Name = "terraform-demo"
  }
}

# -------------------------------------------------------------------------------
# Create the secruity group for the EC2 instance
# -------------------------------------------------------------------------------

resource "aws_security_group" "instance" {
  name = "terraform-demo-instance"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound HTTP from anywhere
  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
