rgvar = {
  rg1 = {
    rg_name    = "rg-develop"
    location   = "japanwest"
    managed_by = "devopsinsiders"
  }
}
vnetvar = {
  vnet1 = {
    vnet_name     = "vnet-dev"
    location      = "japanwest"
    rg_name       = "rg-develop"
    address_space = ["10.0.0.0/16"]
  }
}
subnetvar = {
  subnet1 = {
    subnet_name      = "frontend-subnet"
    rg_name          = "rg-develop"
    vnet_name        = "vnet-dev"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "backend-subnet"
    rg_name          = "rg-develop"
    vnet_name        = "vnet-dev"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet3 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "rg-develop"
    vnet_name        = "vnet-dev"
    address_prefixes = ["10.0.5.0/24"]
  }
}
pipvar = {
  pip1 = {
    pip_name  = "frontend-pip"
    rg_name   = "rg-develop"
    location  = "japanwest"
    pip_alloc = "Static"
  }
  pip2 = {
    pip_name  = "backend-pip"
    rg_name   = "rg-develop"
    location  = "japanwest"
    pip_alloc = "Static"
  }
  pip3 = {
    pip_name  = "bastion-pip"
    rg_name   = "rg-develop"
    location  = "japanwest"
    pip_alloc = "Static"
  }
}
nicvar = {
  nic1 = {
    nic_name    = "frontend-nic"
    location    = "japanwest"
    rg_name     = "rg-develop"
    vnet_name   = "vnet-dev"
    subnet_name = "frontend-subnet"
    pip_name    = "frontend-pip"
  }
  nic2 = {
    nic_name    = "backend-nic"
    location    = "japanwest"
    rg_name     = "rg-develop"
    vnet_name   = "vnet-dev"
    subnet_name = "backend-subnet"
    pip_name    = "backend-pip"
  }
}
linuxvm_var = {
  linuxvm1 = {
    vm_name   = "linux-vm"
    rg_name   = "rg-develop"
    location  = "japanwest"
    size      = "Standard_D2s_v3"
    username  = "adminuser"
    password  = "Qwerty123!@#"
    dpa       = false
    caching   = "ReadWrite"
    sat       = "Standard_LRS"
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
    nic_name  = "frontend-nic"
  }
  linuxvm2 = {
    vm_name   = "linux-vm-backup"
    rg_name   = "rg-develop"
    location  = "japanwest"
    size      = "Standard_D2s_v3"
    username  = "adminuserbackup"
    password  = "Qwerty456!@#"
    dpa       = false
    caching   = "ReadWrite"
    sat       = "Standard_LRS"
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
    nic_name  = "backend-nic"
  }
}
nsgvar = {
  nsg1 = {
    nsg_name = "frontend-nsg"
    nsg_loc  = "japanwest"
    nsg_rgn  = "rg-develop"
  }
  nsg2 = {
    nsg_name = "backend-nsg"
    nsg_loc  = "japanwest"
    nsg_rgn  = "rg-develop"
  }
}
nsrvar = {
  nsr1 = {
    nsr_name     = "AllowSSH"
    nsr_p        = 100
    nsr_dir      = "Inbound"
    nsr_access   = "Allow"
    nsr_protocol = "Tcp"
    nsr_spr      = "*"
    nsr_dpr      = "22"
    nsr_sap      = "*"
    nsr_dap      = "*"
    nsr_rgn      = "rg-develop"
    nsr_nsg_name = "frontend-nsg"
  }
  nsr2 = {
    nsr_name     = "AllowHTTP"
    nsr_p        = 110
    nsr_dir      = "Inbound"
    nsr_access   = "Allow"
    nsr_protocol = "Tcp"
    nsr_spr      = "*"
    nsr_dpr      = "80"
    nsr_sap      = "*"
    nsr_dap      = "*"
    nsr_rgn      = "rg-develop"
    nsr_nsg_name = "frontend-nsg"
  }
  nsr3 = {
    nsr_name     = "AllowRDP"
    nsr_p        = 120
    nsr_dir      = "Inbound"
    nsr_access   = "Allow"
    nsr_protocol = "Tcp"
    nsr_spr      = "*"
    nsr_dpr      = "3389"
    nsr_sap      = "*"
    nsr_dap      = "*"
    nsr_rgn      = "rg-develop"
    nsr_nsg_name = "backend-nsg"
  }
}
# bastionvar = {
#   bastion1 = {
#     bastion_loc = "japanwest"
#     bastion_rgn = "rg-develop"
#   }
# }