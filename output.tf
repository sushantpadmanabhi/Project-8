output "resource_group_name" {
  value = azurerm_resource_group.rg_infra.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg_infra.location
}

output "role_assignment_scope" {
  value = azurerm_role_assignment.contributor_role.scope
}
