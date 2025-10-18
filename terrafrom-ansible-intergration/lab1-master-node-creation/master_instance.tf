provider "aws" {
  region = "ap-south-1"
  # Credentials should be configured using AWS CLI or environment variables
}

# --- Security Group ---
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = "vpc-087e83ba7d370b45b"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "web-server-sg"
    Project = "april-2025"
  }
}

# --- EC2 Instance ---
resource "aws_instance" "web_server" {
  ami                    = "ami-02d26659fd82cf299"
  instance_type          = "t2.micro"
  key_name               = "lab4-aws"
  subnet_id              = "subnet-06a60a79287178ae7"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name    = "web-server"
    Project = "april-2025"
  }

  # Connection block required for remote-exec
  connection {
    type        = "ssh"
    user        = "ubuntu"                     # Amazon Linux → ec2-user, Ubuntu → ubuntu
    private_key = file("/home/jay/lab4-aws.pem")  # path to your private key
    host        = self.public_ip
  }

  # Run commands inside the instance
provisioner "remote-exec" {
  inline = [
    "sudo apt update -y",
    "sudo apt install -y ansible wget unzip",
    "wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip",
    "unzip terraform_1.5.0_linux_amd64.zip",
    "sudo mv terraform /usr/local/bin/",
    "terraform version"
  ]
}


  depends_on = [aws_security_group.web_sg]
}

# --- Outputs ---
output "instance_id" {
  value = aws_instance.web_server.id
}

output "elastic_ip" {
  value = aws_instance.web_server.public_ip
}
