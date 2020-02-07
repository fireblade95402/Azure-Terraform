#Link to Terraform documentation for AFD WAF
#https://www.terraform.io/docs/providers/azurerm/r/front_door.html
az_afd_rg = "demo-afd"
location  = "global"

ARM_CLIENT_ID       = "<Azure Service PRinciple>"
ARM_CLIENT_SECRET   = "<Azure Service Principle Secret>"
ARM_SUBSCRIPTION_ID = "<Azure Subscription>"
ARM_TENANT_ID       = "<Azure Tenant ID>"
ARM_ENVIRONMENT     = "DEV"
ARM_LOCATION        = "uksouth"




front-door-settings = {
  name          = "nds-afd-mwg-test"
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
      host_name                         = "nds-afd-mwg-test.azurefd.net"
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
      web_application_firewall_policy_link_name = "TerraformPolicy" #optional 
    }                                                               #add extra here

  }
}

