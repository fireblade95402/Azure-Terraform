output "object" {
  value = azurerm_network_interface.nic
}

output "nic-map" {
  value = {
    for nic in azurerm_network_interface.nic:
    nic.name => nic.id

  }
}