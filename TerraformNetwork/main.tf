provider "azurerm" {
    version = "1.38.0"
    subscription_id = var.subscriptionID
}

terraform {
  backend "azurerm" {
    resource_group_name   = "Dev5"
    storage_account_name  = "devtfstate65"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_network_security_group" "DevNet" {
    name = var.name
    location = var.location
    resource_group_name = var.RG
}

resource "azurerm_network_security_rule" "Port80" {
  name                        = "Allow80"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.RG
  network_security_group_name = azurerm_network_security_group.DevNet.name
}

resource "azurerm_virtual_network" "vNetDevNet" {
  name                = "vNetDevNet"
  location            = var.location
  resource_group_name = var.RG
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_subnet" "devnet-sub" {
  name                 = "testsubnet"
  resource_group_name  = var.RG
  virtual_network_name = azurerm_virtual_network.vNetDevNet.name
  address_prefix = "10.0.1.0/24"
}
