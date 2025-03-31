## security group for ssh connection
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
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-my_instance_ssh"
  }
}

## security group for maria-db 
resource "aws_security_group" "allow_maria_db" {
  vpc_id = aws_vpc.my_vpc.id
  name = "allow_maria_db"
  description = "security group for Maria DB"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1" // all ways to send packets on aws
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3360
    to_port = 3360
    protocol = "tcp"
    
    ## adding layer of security when only the machine that get 
    ## true ssh connection will be allowed to get the the maria DB
    security_groups = [aws_security_group.allow-my_instance_ssh.id] 
  }
  tags = {
    Name = "allow_maria_db"
  }
}

