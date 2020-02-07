
variable "az_afd_rg" {
  description = "(Required) Map of the resource groups to create"
}

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}

variable "front-door-settings" {
    description = "(Required) Azure Front Door settings"
}
variable "front-door-waf-settings" {
    description = "(Required) Azure Front Door settings"
}

variable "ARM_CLIENT_ID" {
    description = "Client ID for Service Principal"
}

variable "ARM_CLIENT_SECRET" {
    description = "Client Secret for Service Principal"
}

variable "ARM_SUBSCRIPTION_ID" {
    description = "Azure Subscription for deployment"
}

variable "ARM_TENANT_ID" {
    description = "Azure AD tenant identifier for Service Principal"
}

variable "ARM_LOCATION" {
    description = "Azure AD tenant identifier for Service Principal"
}

variable "ARM_ENVIRONMENT" {
    description = "Azure AD tenant identifier for Service Principal"
}


