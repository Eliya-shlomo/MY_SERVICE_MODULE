resource "aws_elb" "this" {
  name = "my-elb"
  subnets = [public_1_id,public_2_id]
  security_groups = [var.ssh_sg_id,var.elb_sg_id]
  
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags = {
    name = "my-elb"
  }
}


