resource "azurerm_bastion_host" "bastionblock" {
    for_each = var.bastionvar
  name                = "bastionhost_azure"
  location            = each.value.bastion_loc
  resource_group_name = each.value.bastion_rgn
  ip_configuration {
    name                 = "internalway"
    subnet_id            = data.azurerm_subnet.data_subnetblock[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data_pipblock[each.key].id
  }
}