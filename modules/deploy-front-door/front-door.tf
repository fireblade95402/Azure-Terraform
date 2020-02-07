module "azure_front_door" {
  source              = "../front-door"

  az_afd_name          = var.front-door-settings.name
  az_afd_rg            = var.az_afd_rg
  location             = var.location
  front-door-settings   = var.front-door-settings
  front-door-waf-settings = var.front-door-waf-settings
  tags                 = ""

  ARM_SUBSCRIPTION_ID = var.ARM_SUBSCRIPTION_ID
  ARM_LOCATION        = var.ARM_LOCATION
  ARM_ENVIRONMENT     = var.ARM_ENVIRONMENT
}