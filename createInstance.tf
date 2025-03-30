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
   user_data = file("Shell_scripts/mount_ebs.yml")

   tags = {
     Name = "my_instance_example"
   }
}

#EBS resource creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"  
  size = 50
  type = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }  
}

##Attach EBS volume with AWS instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.my_instance_example.id
}





 