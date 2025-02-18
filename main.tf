# Configure the Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "da4b743b-bf70-41b9-905f-e402e5dc9066"
}

# Define Resource Group (Optional)
resource "azurerm_resource_group" "rg" {
  name     = "MySecurityRG"
  location = "East US"
}

# Define a Custom Role (Optional)
resource "azurerm_role_definition" "custom_role" {
  name        = "CustomSecurityRole"
  scope       = azurerm_resource_group.rg.id
  description = "Custom role for security operations"

  permissions {
    actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
    not_actions = []
  }

  assignable_scopes = [azurerm_resource_group.rg.id]
}

# Assign a Built-in Role (e.g., Contributor) to a User or Service Principal
resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"  # You can change this to "Reader" or any built-in role
  principal_id         = "c70410dc-f1b5-4dab-94f2-0a8f3330bce9"  # Replace with actual User or SP ID
}
