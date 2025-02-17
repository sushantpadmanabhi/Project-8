provider "azurerm" {
  features {}
}

# Create a Resource Group (needed for scope)
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}

# Create a custom policy definition that denies creation of public IP addresses
resource "azurerm_policy_definition" "deny_public_ip" {
  name         = "deny-public-ip"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny Public IP Creation"
  description  = "This policy denies creation of public IP addresses."

  policy_rule = <<POLICY_RULE
{
  "if": {
    "field": "Microsoft.Network/publicIPAddresses/ipAddress",
    "exists": "true"
  },
  "then": {
    "effect": "deny"
  }
}
POLICY_RULE
}

# Assign the policy to the resource group
resource "azurerm_policy_assignment" "assign_deny_public_ip" {
  name                 = "deny-public-ip-assignment"
  scope                = azurerm_resource_group.example.id
  policy_definition_id = azurerm_policy_definition.deny_public_ip.id
}

# (Optional) Create a custom role definition
resource "azurerm_role_definition" "custom_role" {
  name        = "example-custom-role"
  scope       = azurerm_resource_group.example.id
  description = "Custom role to start or restart VMs"

  permissions {
    actions     = [
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/restart/action"
    ]
    not_actions = []
  }

  assignable_scopes = [
    azurerm_resource_group.example.id
  ]
}

