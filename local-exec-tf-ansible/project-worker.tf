provider "aws" {
  region = "ap-south-1"
  # Credentials should be configured using AWS CLI or environment variables
}

# --- Security Group ---
resource "aws_security_group" "web_sg_1" {
  name        = "web-server-sg-1"
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
    Name    = "web-server-sg-1"
    Project = "april-2025"
  }
}

# --- EC2 Instance ---
resource "aws_instance" "web_server" {
  ami                    = "ami-02d26659fd82cf299"
  instance_type          = "t2.micro"
  key_name               = "lab4-aws"
  subnet_id              = "subnet-06a60a79287178ae7"
  vpc_security_group_ids = [aws_security_group.web_sg_1.id]

  tags = {
    Name    = "project-server"
    Project = "april-2025"
  }

  # Connection block required for remote-exec
  connection {
    type        = "ssh"
    user        = "ubuntu"                     # Amazon Linux → ec2-user, Ubuntu → ubuntu
    private_key = file("/home/ubuntu/lab4-aws.pem")  # path to your private key
    host        = self.public_ip
    timeout     = "2m"
  }

  # Run commands inside the instance
provisioner "local-exec" {
  command = "echo 'Waiting 120 seconds for instance SSH service...' && sleep 60 && ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i '${self.public_ip},' --private-key /home/ubuntu/lab4-aws.pem --ssh-common-args='-o StrictHostKeyChecking=no' ./lab5-ansible-role/test.yml -e 'env=dev'"
}


  depends_on = [aws_security_group.web_sg_1]
}

# --- Outputs ---
output "instance_id" {
  value = aws_instance.web_server.id
}

output "elastic_ip" {
  value = aws_instance.web_server.public_ip
}