terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "AISkillsForDev"
    storage_account_name = "storageaiskillsfordev"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "aiskillsfordev-app-service-plan-01"
  location            = "polandcentral"
  resource_group_name = "AISkillsForDev"
  os_type             = "Linux"
  sku_name            = "P0v3"
}


resource "azurerm_linux_web_app" "example" {
  name                = "aiskillsfordev-webapp-01"
  location            = "polandcentral"
  resource_group_name = "AISkillsForDev"
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}