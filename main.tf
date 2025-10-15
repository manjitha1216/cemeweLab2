#########################################################
# Lab 2 - Launch Apache EC2 instance using Terraform 
# Automatically generates SSH key pair per student
#########################################################

provider "aws" {
  region  = "eu-north-1"
  # profile = "cemewe"  # adjust to your AWS CLI profile
}

#########################################################
# Generate SSH key locally for this student
#########################################################
resource "tls_private_key" "lab_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

#########################################################
# Upload public key to AWS as key pair
#########################################################
resource "aws_key_pair" "lab_key" {
  key_name   = "lab-key-${var.student_name}"
  public_key = tls_private_key.lab_key.public_key_openssh
}

#########################################################
# Launch Apache EC2 instance (Ubuntu, free tier)
#########################################################
resource "aws_instance" "apache_ec2" {
  ami                    = "ami-0a716d3f3b16d290c"  # Ubuntu Server 22.04 LTS in eu-north-1 (free tier)
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.lab_key.key_name
  vpc_security_group_ids = [var.shared_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y apache2

    # Create a custom index.html with S3 image
    cat <<HTML | sudo tee /var/www/html/index.html
    <html>
      <head><title>Welcome</title></head>
      <body style='font-family:Arial; text-align:center; margin-top:50px;'>
        <h1>Hi, ${var.student_name}</h1>
        <h2>Welcome to CeMeWe DevOps Workshop</h2>
        <img src="https://lab1-manjithatest2-bucket.s3.eu-north-1.amazonaws.com/picture111.jpg"
             alt="Workshop Image"
             style="display:block; margin:30px auto; max-width:500px; border-radius:15px; box-shadow:0 0 10px #ccc;">
      </body>
    </html>
    HTML

    sudo systemctl enable apache2
    sudo systemctl restart apache2
  EOF

  tags = {
    Name   = "lab2-${var.student_name}"
    Owner  = var.student_name
    Lab    = "2"
  }
}

#########################################################
# Outputs
#########################################################
output "ec2_public_ip" {
  value = aws_instance.apache_ec2.public_ip
}

output "website_url" {
  value = "http://${aws_instance.apache_ec2.public_ip}"
}
