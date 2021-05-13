
terraform {
  required_providers {
    azurerm = {
      version = ">=2.53.0"
    }
  }

  # Define backend for teraffrom state file. 
  backend "azurerm" {
    resource_group_name  = "adm-aja-test"
    storage_account_name = "statefilestorageterra"
    container_name       = "tfstate"
    key                  = "terraform_staging.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "Main_Resource_Group_RG1" {
  source  = "../Modules/az-resource-group"
  rg_name = "adm_aja_test_module_rg_1_stg"
  rg_tags    = var.tags
}


module "Main_Resource_Group_RG2" {
  source  = "../Modules/az-resource-group"
  rg_name = "adm_aja_test_module_rg_2_stg"
  rg_tags    = var.tags
}



module "Vnet" {
  source      = "../Modules/virtual-network"
  rg_name     = module.Main_Resource_Group_RG1.rg_name
  rg_location = module.Main_Resource_Group_RG1.rg_location
  tags        = var.tags
}