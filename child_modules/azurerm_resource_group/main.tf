resource "azurerm_resource_group" "rgblock" {
  for_each   = var.rgvar
  name       = each.value.rg_name
  location   = each.value.location
  managed_by = each.value.managed_by
}