data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "office_1" {
  instance_type = "t2.micro"
  ami       = data.aws_ami.amazon_linux.id
  subnet_id = aws_subnet.office_1.id
  vpc_security_group_ids = [ aws_security_group.ssh_private.id ]
  key_name = aws_key_pair.cia_key_pair.key_name
  tags = {
    Name = "CIA Instance Office 1"
  }
}

resource "aws_instance" "office_2" {
  instance_type = "t2.micro"
  ami       = data.aws_ami.amazon_linux.id
  subnet_id = aws_subnet.office_2.id
  vpc_security_group_ids = [ aws_security_group.ssh_private.id ]
  key_name = aws_key_pair.cia_key_pair.key_name
  tags = {
    Name = "CIA Instance Office 2"
  }
}

resource "aws_instance" "office_3" {
  instance_type = "t2.micro"
  ami       = data.aws_ami.amazon_linux.id
  subnet_id = aws_subnet.office_3.id
  vpc_security_group_ids = [ aws_security_group.ssh_private.id ]
  key_name = aws_key_pair.cia_key_pair.key_name
  tags = {
    Name = "CIA Instance Office 3"
  }
}

resource "aws_instance" "remote_office" {
  instance_type = "t2.micro"
  ami       = data.aws_ami.amazon_linux.id
  subnet_id = aws_subnet.remote_office.id
  vpc_security_group_ids = [ aws_security_group.ssh_private.id, aws_security_group.ssh_public.id ]
  key_name = aws_key_pair.cia_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "CIA Instance Remote Office"
  }
}
