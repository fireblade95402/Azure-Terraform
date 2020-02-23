module "rg_caftest" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "virtual-machine" {
  source = "../../../virtual-machine"

  resource_group_name   = module.rg_caftest.names.test
  location              = local.location
  vms-object            = var.vms-object
  nics-object           = var.nics-object
  tags                  = local.tags
}

