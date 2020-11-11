output id {
  value = ibm_is_subnet.subnet.id
}

output available_ipv4_address_count {
  value = ibm_is_subnet.subnet.available_ipv4_address_count
}

output ipv4_cidr_block {
  value = ibm_is_subnet.subnet.ipv4_cidr_block
}