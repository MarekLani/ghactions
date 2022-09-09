terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
  backend "azurerm" {
  }
}
provider "azurerm" {
  use_oidc = true
  features {}
}
data "azurerm_client_config" "current" {}
#Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = "${var.prefix}ghactions"
  location = "eastus2"
}