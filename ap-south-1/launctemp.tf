data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["frontend-ami*"] # Add a wildcard to match variations
  }

  owners = ["961341534599"] # Ensure this is correct

  filter {
    name   = "state"
    values = ["available"] # Only fetch available AMIs
  }
}

# Launch Template Resource
resource "aws_launch_template" "frontend" {
  name = "frontend-terraform"
  description = "frontend-terraform"
  image_id = data.aws_ami.example.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.frontend-server-sg.id]
  key_name = "darling" 
  user_data = filebase64("${path.module}/frontend-lt.sh")
  #default_version = 1
  update_default_version = true
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "frontend-terraform"
    }
  }
}

###################################################################################
data "aws_ami" "example1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["backend-ami*"] # Add a wildcard to match variations
  }

  owners = ["961341534599"] # Ensure this is correct

  filter {
    name   = "state"
    values = ["available"] # Only fetch available AMIs
  }
}

# Launch Template Resource
resource "aws_launch_template" "backend" {
  name = "backend-terraform"
  description = "backend-terraform"
  image_id = data.aws_ami.example1.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.backend-server-sg.id]
  key_name = "darling" 
  user_data = filebase64("${path.module}/backend-lt.sh")
  #default_version = 1
  update_default_version = true
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "backend-terraform"
    }
  }
}