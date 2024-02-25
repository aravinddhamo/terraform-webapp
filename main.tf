# 1. Terraform Settings Block
terraform {
  # 1. Required Version Terraform
  required_version = ">= 0.13"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }

# Terraform State Storage to Azure Storage Container
#  backend "azurerm" {
#    resource_group_name   = "terraform-storage-rg"
#    storage_account_name  = "terraformstate23"
#    container_name        = "tfstatefiles"
#    key                   = "terraform-custom-vnet.tfstate"
#  }  
}



# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}

