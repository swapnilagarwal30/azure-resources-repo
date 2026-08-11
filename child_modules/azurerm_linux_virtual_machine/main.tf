resource "azurerm_linux_virtual_machine" "linuxvm_block" {
  for_each                        = var.linuxvm_var
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.username
  admin_password                  = each.value.password
  disable_password_authentication = each.value.dpa
  network_interface_ids           = [data.azurerm_network_interface.data_nicblock[each.key].id]
  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.sat
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}