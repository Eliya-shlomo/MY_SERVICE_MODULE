##AutoScaling Lunch Configuration

resource "aws_key_pair" "key_connect_instance" {
   key_name = "key_connect_instance"
   public_key = file(var.path_to_public_key)
 }

resource "aws_launch_template" "my-launchtemplate" {
  name_prefix            = "my-launchtemplate"
  image_id               = lookup(var.AMIS,var.aws_region)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key_connect_instance.key_name
  vpc_security_group_ids = [var.elb_sg_id,var.ssh_sg_id]
  user_data              = base64encode(
    <<-EOF
                            #!/bin/bash
                            apt-get update
                            apt-get -y install net-tools nginx
                            MYIP=$(ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2)
                            echo 'Hello Team
                            This is my IP: '$MYIP > /var/www/html/index.html
                            EOF
  )

  lifecycle {
    create_before_destroy = true
  }

}

#Autoscaling Group
resource "aws_autoscaling_group" "this" {
  name = "my-launchtemplate-group"
  load_balancers = [var.elb_name]
  vpc_zone_identifier = [var.public_1_id,var.public_2_id]
  min_size = 1 
  max_size = 2
  health_check_type = "EC2"
  force_delete = true
  launch_template {
    id      = aws_launch_template.my-launchtemplate.id
    version = "$Latest"
  }
  
  tag{
    key = "Name"
    value = "My custom EC2 instance - Provide by The autoscaling group"
    propagate_at_launch = true
  }
}


