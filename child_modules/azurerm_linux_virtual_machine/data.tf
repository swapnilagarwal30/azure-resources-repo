data "azurerm_network_interface" "data_nicblock" {
  for_each            = var.linuxvm_var
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}