variable "subscriptionID" {
    type = string
    description = "Variable for our resource group"
}

variable "name" {
    type = string
    description = "Name of security group"
}

variable "location" {
    type = string
    description = "region that security group will exist in"
}

variable "RG" {
    type = string
    description = "resource group that security group will live in"
}