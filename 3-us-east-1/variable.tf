variable "rds-password" {
    description = "rds password"
    type = string
    default = "password123"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
variable "ami" {
    description = "ami"
    type = string
    default = "ami-053b12d3152c0cc71"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t2.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "darling"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}