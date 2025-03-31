##RDS Resources
resource "aws_db_subnet_group" "mariadb_subnets" {
  name = "mariadb_subnets"
  description = "AMAZON RDS Subnets groups"
  subnet_ids = [aws_subnet.my_private_subnet-1.id,aws_subnet.my_private_subnet-2.id]
}

#RDS Parameters
resource "aws_db_parameter_group" "my-mariadb_parameters" {
  name        = "my-mariadb-parameters"
  family      = "mariadb10.4"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

#RDS Instance properties
resource "aws_db_instance" "my-mariadb" {
  allocated_storage       = 20             # 20 GB of storage
  engine                  = "mariadb"
  engine_version          = "10.6.21"
  instance_class          = "db.t4.micro"  
  identifier              = "mariadb"
  username                = "root"           # username
  password                = "mariadb141"     # password
  db_subnet_group_name    = aws_db_subnet_group.mariadb_subnets.name
  parameter_group_name    = aws_db_parameter_group.my-mariadb_parameters.name
  multi_az                = "false"            # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids  = [aws_security_group.allow_maria_db.id]
  storage_type            = "gp2"
  backup_retention_period = 30                                          # how long you’re going to keep your backups
  availability_zone       = aws_subnet.my_private_subnet-1.availability_zone # preferred AZ
  skip_final_snapshot     = true                                        # skip final snapshot when doing terraform destroy

  tags = {
    Name = "my-mariadb"
  }
}

output "rds" {
  value = aws_db_instance.my-mariadb.endpoint
}