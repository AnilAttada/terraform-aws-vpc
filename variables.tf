variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "project" {
    type = string
}
variable "environment" {
    type = string
}
variable "igw_tags" {
    type = map(string)
    default = {}
}
variable "public_subnet_cidr_block" {
  type = list(string)
}
variable "vpc_tags" {
  type = map(string)
  default = {}
}
variable "private_subnet_cidr_block" {
  type = list(string)
}
variable "public_subnet_tags" {
  type = map(string)
  default = {}
}
variable "private_subnet_tags" {
  type = map(string)
  default = {}
}
variable "database_subnet_cidr_block" {
  type = list(string)
}
variable "database_subnet_tags" {
  type = map(string)
  default = {}
}