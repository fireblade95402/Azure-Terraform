#output

output "front-door-object" {
  value = azurerm_frontdoor.front-door
}

output "waf-object" {
  value = module.azure_front_door_waf.object
}

