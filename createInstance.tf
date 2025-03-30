## when the instance is initialize, the machine will use this public key to get in the machine
resource "aws_key_pair" "key_connect_instance" {
   key_name = "key_connect_instance"
   public_key = file(var.path_to_public_key)
 }
 
 
 resource "aws_instance" "my_instance_example" {
   ami             = lookup(var.AMIS, var.aws_region) 
   instance_type = "t2.micro"
   vpc_security_group_ids = [aws_security_group.allow-my_instance_ssh.id]
   subnet_id = aws_subnet.my_public_subnet-1.id
   key_name      = aws_key_pair.key_connect_instance.key_name
    
 }
 