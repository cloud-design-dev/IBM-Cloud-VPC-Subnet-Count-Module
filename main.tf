resource ibm_is_subnet subnet {
  name                     = var.name
  vpc                      = var.vpc_id
  zone                     = var.zone
  total_ipv4_address_count = var.address_count
  network_acl              = var.network_acl
  public_gateway           = local.public_gateway
  resource_group           = var.resource_group
}

locals {
  public_gateway = var.public_gateway != "" ? var.public_gateway : null
}
