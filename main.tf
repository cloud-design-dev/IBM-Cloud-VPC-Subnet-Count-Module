resource ibm_is_subnet subnet {
  name                     = "${var.name}-${var.zone}-subnet"
  vpc                      = var.vpc_id
  zone                     = var.zone
  total_ipv4_address_count = local.address_count
  network_acl              = local.network_acl
  public_gateway           = local.public_gateway
  resource_group           = data.ibm_resource_group.group.id
}

locals {
  address_count  = var.address_count != "" ? var.address_count : "256"
  network_acl    = var.network_acl != "" ? var.network_acl : ""
  public_gateway = var.public_gateway != "" ? var.public_gateway : null
}
