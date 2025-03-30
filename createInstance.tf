## when the instance is initialize, the machine will use this public key to get in the machine
resource "aws_key_pair" "my__pub_key_for_connect_instance" {
   key_name = "my__pub_key_for_connect_instance"
   public_key = file(var.path_to_public_key)
 }
 
 
 resource "aws_instance" "my_instance_example" {
   ## ami hard coded, depends on the zone we uploading
   ami             = lookup(var.AMIS, var.aws_region) 
 
   security_groups = "${allow-my_instance_ssh}"
 
   provisioner "file" {
     source = "installNginx.sh"
     destination = "/tmp/installNginx.sh"
   }
 
   provisioner "remote-exec" {
     inline = [
       "chmod +x /tmp/installNginx.sh",
       "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",
       "sudo /tmp/installNginx.sh"
     ]
   }
 
   connection {
     host = coalesce(self.public_ip, self.private_ip)
     type = "ssh"
     user = var.instance_username
     private_key = file(var.path_to_private_key)
   }

 }
 