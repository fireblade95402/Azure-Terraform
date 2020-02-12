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

