locals {
    location = "uksouth"
    prefix = "test"
    resource_groups = {
        test = { 
            name     = "-caf-vm"
            location = "uksouth" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }
}