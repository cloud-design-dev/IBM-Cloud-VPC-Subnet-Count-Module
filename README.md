# Subnet Module for IBM CLoud VPC 
Terraform module for creating a VPC Subnet in IBM Cloud based on the `total_ipv4_address_count` option. 

## Usage
If you need to include an IBM Cloud VPC in your deployment you can use the following code:

### Subnet **without** a public gateway attached

```
data "ibm_resource_group" "group" {
  name = var.resource_group
}

data "ibm_is_zones" "mzr" {
  region = var.region
}

module subnet {
  source         = "git::https://github.com/cloud-design-dev/ibm-vpc-subnet-count-module.git"
  name           = var.name
  resource_group = data.ibm_resource_group.group.id
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc_id         = var.vpc_id
  zone           = data.ibm_is_zones.mzr.zones[0]
}
```

### Subnet **with** a public gateway attached

```
data "ibm_resource_group" "group" {
  name = var.resource_group
}

data "ibm_is_zones" "mzr" {
  region = var.region
}

module subnet {
  source         = "git::https://github.com/cloud-design-dev/ibm-vpc-subnet-count-module.git"
  name           = var.name
  resource_group = data.ibm_resource_group.group.id
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc_id         = var.vpc_id
  zone           = data.ibm_is_zones.mzr.zones[0]
  public_gateway = ibm_is
}
```

## Variables 
 - **resource_group:** The Resource Group name. This gets used as a data source for the deployed resources.
 - **name:** Name that gets assigned to the subnet.
 - **address_count:** Number of IPs to assign to the subnet. Default is `256`.
 - **network_acl:** The Network ACL to assign to the subnet. 
 - **public_gateway:** Public Gateway ID to use with subnet
 - **vpc_id:** VPC to target for new subnet. 
 - **zone**: The VPC zone where the subnet will be created.

## Outputs
 - **id:** The ID of the created subnet.
 - **ipv4_cidr_block:** The IPv4 CIDR block for the newly created subnet. 
