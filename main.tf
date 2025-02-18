# Configure the Azure Provider
provider "azurerm" {
  features {}
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
  principal_id         = "<YOUR_AZURE_USER_OR_SERVICE_PRINCIPAL_ID>"  # Replace with actual User or SP ID
}
