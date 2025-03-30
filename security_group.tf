resource "aws_security_group" "allow-my_instance_ssh" {
  vpc_id = aws_vpc.my_vpc.id
  name = "allow-my_instance_ssh"
  description = "security group that allow ssh connection"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1" // all ways to send packets on aws
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [""]
  }
  tags = {
    Name = "allow-my_instance_ssh"
  }
}

