# Create a Front Door with associated WAF Policies linked to Frontend Endpoints

Creates a Front Front Door with:

* 1 to many Backend Pools
* 1 to many Routing Rules
* 1 to many Frontend Endpoints
* 1 to many WAF Policies and links them to Frontend Endpoints
 
Reference the module to a specific version (recommended):
```hcl
module "front-door" {
    source = "aztfmod/caf-front-door/azurerm"
    version = "0.x.y"
    
    front-door-rg           = var.rg
    location                = var.location
    front-door-object       = var.front-door-object
    front-door-waf=object   = var.front-door-waf-object
    tags                    = var.tags
}
```

## Inputs
| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| front-door-rg | string | None | Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| location | string | None | Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  | 
| front-door-object | object | None | Front Door configuration object as described in the Parameters section.  | 
| networking_object | object | None | Front Door WAF configuration object as described in the Parameters section.  | 
| tags | map | None | Map of tags for the deployment.  | 

## Parameters

### front-door-object
(Required_ Confirguration object describing the Front Door configuration.
The object has 3 mandatory sections as follows:

#### Frontend Endpoints

#### Backend Pools

#### Routing Rules

The following front-door-object shows an example of the composition:

```hcl
Sample of front door configuration object below

front-door-settings = {
  name          = "<your AFD Name>"
  friendly_name = "My Azure Front Door Service" #optional
  #disable_bgp_route_propagation                = false                           #Default: false
  enforce_backend_pools_certificate_name_check = false
  load_balancer_enabled                        = true #Default: true  

  #tags = inherit from terraform structure                                        #optional

  routing_rule = {
    rr1 = {
      name               = "exampleRoutingRule1"
      frontend_endpoints = ["exampleFrontendEndpoint1"]
      accepted_protocols = ["Http", "Https"] #default: "Http"
      patterns_to_match  = ["/*"]            #default: "/*"
      enabled            = true              #default: true
      configuration      = "Forwarding"      #Options: Forwarding / Redirect  
      forwarding_configuration = {
        backend_pool_name                     = "exampleBackendBing1"
        cache_enabled                         = false       #default: false
        cache_use_dynamic_compression         = false       #default: false
        cache_query_parameter_strip_directive = "StripNone" #default: "StripNone"
        custom_forwarding_path                = ""
        forwarding_protocol                   = "MatchRequest" #default: "BestMatch"  
      }
      redirect_configuration = {
        custom_host         = ""             #optional
        redirect_protocol   = "MatchRequest" #default: "MatchRequest"  
        redirect_type       = "Found"        #default: "Found"
        custom_fragment     = ""
        custom_path         = ""
        custom_query_string = ""
      }
    } #add extra routing rules here
  }

  backend_pool_load_balancing = {
    lb1 = {
      name                            = "exampleLoadBalancingSettings1"
      sample_size                     = 4 #default: 4
      successful_samples_required     = 2 #default: 2
      additional_latency_milliseconds = 0 #default: 0
    }                                     #add extra backend load balancing names here
  }

  backend_pool_health_probe = {
    hp1 = {
      name                = "exampleHealthProbeSetting1"
      path                = "/"
      protocol            = "Http" #default: Http
      interval_in_seconds = 120    #default: 120
    }                              #add extra health probes here
  }

  backend_pool = {
    bp1 = {
      name = "exampleBackendBing1"
      backend = {
        be1 = {
          enabled     = true
          address     = "www.bing.com"
          host_header = "www.bing.com"
          http_port   = 80
          https_port  = 443
          priority    = 1  #default: 1
          weight      = 50 #default: 50
        },
        be2 = {
          enabled     = true
          address     = "www.bing.co.uk"
          host_header = "www.bing.co.uk"
          http_port   = 80
          https_port  = 443
          priority    = 1  #default: 1
          weight      = 50 #default: 50
        }
      }
      load_balancing_name = "exampleLoadBalancingSettings1"
      health_probe_name   = "exampleHealthProbeSetting1"
    } #add extra backend pools here
  }

  frontend_endpoint = {
    fe1 = {
      name                              = "exampleFrontendEndpoint1"
      host_name                         = "<your AFD Name>.azurefd.net"
      session_affinity_enabled          = false #default: false
      session_affinity_ttl_seconds      = 0     #default: 0
      custom_https_provisioning_enabled = false
      #Required if custom_https_provisioning_enabled is true
      custom_https_configuration = {
        certificate_source = "FrontDoor" #Optional (FrontDoor / AzureKeyVault)
        #If certificate source is AzureKeyVault the below are required:
        azure_key_vault_certificate_vault_id       = ""
        azure_key_vault_certificate_secret_name    = ""
        azure_key_vault_certificate_secret_version = ""
      }
      web_application_firewall_policy_link_name = "TerraformPolicy" #optional Enter the name of the waf policy you'll be creating 
    }                                                               #add extra here

  }
}

```

## Output

| Name | Type | Description | 
| -- | -- | -- | 

 The WAF policies are linked to the Frontend Endpoints within Azure Front Door.
 
## Example running Terraform

From the modules/deploy-front-door folder. You can run a similar statement to below:

```bash
terraform init
terraform plan -var-file="../../org/dev/front-door.tfvars" -var-file="../../org/dev/front-door-waf.tfvars"
terraform apply -var-file="../../org/dev/front-door.tfvars" -var-file="../../org/dev/front-door-waf.tfvars"
```

