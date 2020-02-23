vms-object = {
    vm1 = {
        name                    = "myvm-1"
        tags                    = ""

        vm_size                 = "Standard_DS1_v2"
        zones                   = ["1", "2"]
        network_interface_ids   = "myvm1-nic"

        delete_os_disk_on_termination     = true

        boot_diagnostics  = {
            enabled                         = false
            storage_uri                     = ""
        }

        storage_image_reference = {
            #id                              
            publisher = "Canonical"
            offer     = "UbuntuServer"
            sku       = "16.04-LTS"
            version   = "latest"
        } 

        storage_os_disk = {
            name                            = "myvm1-1-disk"
            caching                         = "ReadWrite"
            create_option                   = "FromImage"
            managed_disk_type               = "Standard_LRS"
        } 

        
        os_profile = {
            computer_name                   = "myvm-1"
            admin_username                  = "<admin user>"
            admin_password                  = "<admin password>"
        }


        os_profile_linux_config = {
            disable_password_authentication     = false        
        }
    },
    vm2 = {
        name                    = "myvm-2"
        tags                    = ""

        vm_size                 = "Standard_DS1_v2"
        zones                   = ["1", "2"]
        network_interface_ids   = "myvm2-nic"

        delete_os_disk_on_termination     = true

        boot_diagnostics  = {
            enabled                         = false
            storage_uri                     = ""
        }

        storage_image_reference = {
            #id  
            publisher = "Canonical"
            offer     = "UbuntuServer"
            sku       = "16.04-LTS"
            version   = "latest"
        } 

        storage_os_disk = {
            name                            = "myvm2-1-disk"
            caching                         = "ReadWrite"
            create_option                   = "FromImage"
            managed_disk_type               = "Standard_LRS"
        } 

        
        os_profile = {
            computer_name                   = "myvm-2"
            admin_username                  = "<admin user>"
            admin_password                  = "<admin password>"
        }


        os_profile_linux_config = {
            disable_password_authentication     = false        
        }
    }
}

nics-object = {
    nic1 = {
        name                = "myvm1-nic"
        ip_configuration = {
            name                          = "myvm1-ipconfig"
            subnet_id                     = "<subnet id>"
            private_ip_address_allocation = "Dynamic"
        }
    },
    nic2 = {
        name                = "myvm2-nic"
        ip_configuration = {
            name                          = "myvm2-ipconfig"
            subnet_id                     = "<subnet id>"
            private_ip_address_allocation = "Dynamic"
        }
    }  
}
