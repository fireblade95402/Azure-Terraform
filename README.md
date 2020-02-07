# Azure-Terraform

This is an example of deploying Azure Front Door and attaching a WAF to the frontend hosts all via Terraform.


## NOTE
It's a WIP, but to get this working. You'll need to update 2x tfvar files. One for Azure Front Door and the other for the WAF Polcies.

Example: 

From the modules/deploy-front-door folder. You can run a similar statement to below:

```bash
terraform init
terraform plan -var-file="../../org/dev/front-door.tfvars" -var-file="../../org/dev/front-door-waf.tfvars"
terraform apply -var-file="../../org/dev/front-door.tfvars" -var-file="../../org/dev/front-door-waf.tfvars"
```
Also, as this is a rough example. The secrets will need to be handled in a better way. To run this, you'll need the following:

```terraform
ARM_CLIENT_ID       = "<Azure Service Principle>"
ARM_CLIENT_SECRET   = "<Azure Service Principle Secret>"
ARM_SUBSCRIPTION_ID = "<Azure Subscription>"
ARM_TENANT_ID       = "<Azure Tenant ID>"
ARM_ENVIRONMENT     = "DEV"
ARM_LOCATION        = "uksouth"
```
Good Luck!