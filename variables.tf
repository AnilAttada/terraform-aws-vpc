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
