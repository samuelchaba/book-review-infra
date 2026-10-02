data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/22.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_key_pair" "bookreview" {
  key_name   = "${var.application_name}-${var.environment}-key"
  public_key = file(pathexpand(var.ssh_public_key))
}

resource "aws_instance" "frontend" {
  ami                         = data.aws_ssm_parameter.ubuntu_ami.value
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
  ami                         = data.aws_ssm_parameter.ubuntu_ami.value
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
