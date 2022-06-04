resource "aws_security_group" "ssh_private" {
  vpc_id = aws_vpc.cia_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [ "192.168.0.0/20" ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = [ "192.168.0.0/20" ]
  }
}

resource "aws_security_group" "ssh_public" {
  vpc_id = aws_vpc.cia_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}