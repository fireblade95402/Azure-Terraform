# Azure Front Door with WAF Policy Sample

Creates an Azure Front Door plus WAF Policy and links the policy to a Frontend EndPoint within Azure Frond Door

## Usage

To run this example, simply follow to steps below: 

* Change the following parameters before running the Terraform commands:

  * front-door.tfvars:
    ```hcl
    front-door-object = {
    name          = "<Name for Front Door>" # Change to a unique name
    ```
    and 

    ```hcl
    frontend_endpoint = {
        fe1 = {
          host_name                         = "<Name for Front Door>.azurefd.net" # change to use the unique name above and concatinate ".azurefd.net"
    ```

* Once updated the commands below can be run to execute the creation:

  ```hcl
  terraform init
  terraform plan --var-file="front-door.tfvars" --var-file="front-door-waf.tfvars"
  terraform apply --var-file="front-door.tfvars" --var-file="front-door-waf.tfvars"
  ```

  Once you are done, just run 
  ```hcl
  terraform destroy
  ```

## Outputs
| Name | Description |
| --   | -- |
| object | Returns the Azure Container Registry object | 
