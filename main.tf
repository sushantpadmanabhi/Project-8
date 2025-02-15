provider "azurerm" {
  features {}
  subscription_id = "da4b743b-bf70-41b9-905f-e402e5dc9066"
}

resource "azurerm_resource_group" "rg_infra" {
  name     = "prod-infrastructure-rg"
  location = "East US"
}

resource "azurerm_role_assignment" "contributor_role" {
  scope                = azurerm_resource_group.rg_infra.id
  role_definition_name = "Contributor"
  principal_id         = "01a2cd77-45f8-4e38-a98d-23fa51579947"
}
