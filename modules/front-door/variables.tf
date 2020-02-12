variable "az_afd_name" {
  description = "(Required) Name of the Azure Front Door to be created"  
}

variable "location" {
  description = "(Required) Location of the Azure  Front Door to be created"  
}

variable "tags" {
  description = "(Required) Tags of the Azure  Front Door to be created"  
}

variable "az_afd_rg" {
  description = "(Required) Resource Group of the Azure  Front Door to be created"  
}

variable "front-door-settings" {
  description = "(Required) AFD Settings of the Azure  Front Door to be created"  
}

variable "front-door-waf-settings" {
    description = "(Required) Azure Front Door settings"
}

variable "ARM_LOCATION" {
    description = "The geo location to which the resources are being deployed"
}

variable "ARM_ENVIRONMENT" {
    description = "The deployment environment acronym to which the resources are being deployed"
}

variable "ARM_SUBSCRIPTION_ID" {
    description = "Azure Subscription for deployment"
}
