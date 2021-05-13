Azure Resource Group Module
======
## Variables
  rg_name - Resource Group Name <br>
  rg_location - Resource Group Location. Default is "West Europe" <br>
  rg_tags - Associated Tags


## Outputs 
output "rg_location" - Resource Group Location <br>
output "rg_name" - Resource Grop Name <br>
output "rg_id"  - Resource Group ID 

## How to reference child module in root module
```module "Main_Resource_Group_RG1" {                                     #module name that you give in root module. 
  source  = "../Modules/az-resource-group"                                #path to directory containing the module 
  rg_name = "adm_aja_test_module_rg_1"                                    #seting requared variables for module to work
  rg_tags    = {
    "owner" = "admin"
     "evn"   = "prod"                                                     #seting requared variables for module to work
}
```
## Reference child data arguments inside another resource block
In a parent module, outputs of child modules are available in expressions as module.<MODULE NAME>.<OUTPUT NAME>. 
```
module "Vnet" {
  source      = "../modules/virtual-network"
  rg_name     = module.Main_Resource_Group_RG1.rg_name
  rg_location = module.Main_Resource_Group_RG1.rg_location
  tags        = var.tags
}
```
