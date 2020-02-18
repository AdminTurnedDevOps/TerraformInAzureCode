variable "location" {
    type = string
    description = "Region of your service"
}

variable "resourceGroupName" {
    type = string
    description = "Resource group name of the resource group that you want your service to be in"
}

variable "kind" {
    type = string
    description = "Operating system for your app service plan - Linux or Windows"
}

variable "size" {
    type = string
    description = "size of the web app plan. Default is F1"
}

variable "name" {
    type = string
    description = "Name of app service plan"
}