provider "aws" {
  region = "eu-west-2"
  #version = "~> 3.10.0"

}

resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
}


resource "aws_instance" "EC2"{
  ami = var.ami
  instance_type = var.type
}

resource "aws_instance" "EC2_1"{
  ami = var.ami
  instance_type = var.type
}

resource "aws_db_instance" "production_db" {
 allocated_storage = 20
 storage_type      = "gp2"
 engine            = "mysql"
 engine_version    = "5.7"
 instance_class    = "db.t2.micro"
 name              = "production_db"
 username          = "admin"
 password          = "password"
 skip_final_snapshot  = true
}

resource "aws_db_instance" "test" {

 allocated_storage = 20
 storage_type      = "gp2"
 engine            = "mysql"
 engine_version    = "5.7"
 instance_class    = "db.t2.micro"
 name              = "test_db"
 username          = "admin"
 password          = "password"
 skip_final_snapshot  = true
}