# Configure the AWS Provider
# Create a provider block

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
# The provider version constraint is required to be moved to the `required_providers` block
# Due to deprecated versions

provider "aws" {
  region = "us-east-1"
}

# Resources
# Create a VPC
resource "aws_vpc" "initial_vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "brian_initial_vpc"
  }
}

# Create a subnet
resource "aws_subnet" "initial_subnet" {
    vpc_id = aws_vpc.initial_vpc.id
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "brian_initial_subnet"
    }
}


# Create an EC2 instance
resource "aws_instance" "getting_started" {
  ami = "ami-08bf0e5db5b302e19"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.initial_subnet.id

  # Add tags to your resource
  tags = {
    Name = "initial instance"
    Brian = "Mathenge"
  }
}