resource "aws_security_group" "Frontend_Alb" { 
  description = "This is my ALB Sg that allow HTTP, https from the internet"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.sg_name}-Frontend-ALB SG"
  }
}

#create security group webserver that allow HTTP, https from frontend ALB
resource "aws_security_group" "Webserver" {
  description = "This is my Webserver Sg that allow HTTP, https from frontend ALB"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.Frontend_Alb.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.Frontend_Alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.sg_name}-Web-Server SG"
  }
}

# /////////////////////////////////////////////////////////////////////////////////////////////////
#create security group for internal ALB that allow HTTP, https from webserver
resource "aws_security_group" "Internal_Alb" {
  description = "This is my Internal ALB Sg that allow HTTP, https from webserver"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.Webserver.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.Webserver.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  tags = {
    Name = "${var.sg_name}-Internal-ALB SG"
  }
}

# /////////////////////////////////////////////////////////////////////////////////////////////////
#create security group for app server that allow HTTP, https from internal ALB
resource "aws_security_group" "App_Server" {
  description = "This is my App Server Sg that allow HTTP, https from internal ALB"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.Internal_Alb.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.Internal_Alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.sg_name}-App-Server SG"
  }
} 

# /////////////////////////////////////////////////////////////////////////////////////////////////
#create security group for db server that allow MySQL from app server
resource "aws_security_group" "Db_Server" {
  description = "This is my DB Server Sg that allow MySQL from app server"
 vpc_id= var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.App_Server.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.sg_name}-DB-Server SG"
  }
}

# /////////////////////////////////////////////////////////////////////////////////////////////////
#create security group for bastion host that allow SSH from my IP
resource "aws_security_group" "Bastion_Host" {
  description = "This is my Bastion Host Sg that allow SSH from my IP"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.sg_name}-Bastion-Host SG"
  }
}

