module "network-interface" {
  source              = "./network-interface"  
  location            = var.location
  resource_group_name = var.resource_group_name
  nics-object         = var.nics-object 
  tags                = var.tags
}



resource "azurerm_virtual_machine" "virtual_machine" {
    depends_on                  = [module.network-interface]            
    for_each = var.vms-object

    name                            = each.value.name
    location                        = var.location
    resource_group_name             = var.resource_group_name
    network_interface_ids           = [module.network-interface.nic-map[each.value.network_interface_ids]] 
    vm_size                         = each.value.vm_size
    delete_os_disk_on_termination   = each.value.delete_os_disk_on_termination
    tags                            = var.tags

    dynamic "boot_diagnostics" {
        for_each = [each.value.boot_diagnostics]
        content {
            enabled             = boot_diagnostics.value.enabled
            storage_uri         = boot_diagnostics.value.storage_uri
        }
    }

    dynamic "storage_image_reference" {
        for_each = [each.value.storage_image_reference]
        content {
            publisher = storage_image_reference.value.publisher
            offer     = storage_image_reference.value.offer
            sku       = storage_image_reference.value.sku
            version   = storage_image_reference.value.version
        }
    }

    dynamic "storage_os_disk" {
        for_each = [each.value.storage_os_disk]
        content {
            name                            = storage_os_disk.value.name
            caching                         = storage_os_disk.value.caching
            create_option                   = storage_os_disk.value.create_option
            managed_disk_type               = storage_os_disk.value.managed_disk_type
        }
    }

    dynamic "os_profile" {
        for_each = [each.value.os_profile]
        content {
            computer_name                   = os_profile.value.computer_name
            admin_username                  = os_profile.value.admin_username
            admin_password                  = os_profile.value.admin_password
        }
    }

    dynamic "os_profile_linux_config" {
        for_each = [each.value.os_profile_linux_config]
        content {
            disable_password_authentication = os_profile_linux_config.value.disable_password_authentication
        }
    }
}







        



