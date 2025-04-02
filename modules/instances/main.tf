## when the instance is initialize, the machine will use this public key to get in the machine
resource "aws_key_pair" "key_connect_instance" {
   key_name = "key_connect_instance"
   public_key = file(var.path_to_public_key)
 }
 
 
resource "aws_instance" "this" {
   ami                    = lookup(var.AMIS,var.aws_region) 
   instance_type          = var.instance_type
   vpc_security_group_ids = [var.elb_sg_id,var.ssh_sg_id]
   subnet_id             =  var.public_1_id
   key_name               = aws_key_pair.key_connect_instance.key_name
   user_data              = file("../Shell_scripts/mount_ebs.yml")
   iam_instance_profile   = var.s3-my_bucket-role-instanceprofile_name
   

   tags = {
     Name = "my_instance_example"
   }
}



 