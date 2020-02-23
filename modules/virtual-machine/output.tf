output "vms-object" {
  value = azurerm_virtual_machine.virtual_machine
}

output "nics-object" {
  value = module.network-interface.object
}