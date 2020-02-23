resource "azurerm_network_interface" "nic" {
  for_each = var.nics-object
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "ip_configuration" {
      for_each = [each.value.ip_configuration]
      content {
          name = ip_configuration.value.name
          subnet_id = ip_configuration.value.subnet_id
          private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      }
  }
}