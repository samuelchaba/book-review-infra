data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "bookreview" {
  key_name   = "${var.application_name}-${var.environment}-key"
  public_key = file(pathexpand(var.ssh_public_key))
}

resource "aws_instance" "frontend" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.frontend_security_group_id]
  key_name                    = aws_key_pair.bookreview.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.application_name}-${var.environment}-frontend"
    Role = "frontend"
  }
}

resource "aws_instance" "backend" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.backend_security_group_id]
  key_name                    = aws_key_pair.bookreview.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.application_name}-${var.environment}-backend"
    Role = "backend"
  }
}
