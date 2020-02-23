variable "location" {
    description = "(Required) location for VM's to be deployed"    
}

variable "resource_group_name" {
    description = "(Required) Resource Group for VM's to be deployed too"
}

variable "nics-object" {
    description = "(Required) Creates 1 to many"
}

variable "tags" {
  description = "(Required) Tags of the Front Door to be created"  
}
