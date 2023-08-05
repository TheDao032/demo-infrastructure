variable "ami" {
  description = "This is a ami_id of aws_instance"
  type = string
  default = "ami-0a481e6d13af82399" // Amazon Linux 2023 AMI 2023.1.20230725.0 x86_64 HVM kernel-6.1
}

variable "instance_type" {
  description = "This is a instance_type of aws_instance"
  type = string
  default = "t2.micro"
}
