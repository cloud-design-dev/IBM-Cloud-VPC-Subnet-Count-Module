# Subnet Module for IBM CLoud VPC 
Terraform module for creating a VPC Subnet in IBM Cloud based on the `total_ipv4_address_count` option. If you need to specify the exact CIDR ranges for the subnet, please use the [IBM-Cloud-VPC-Subnet-CIDR-Module](https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-CIDR-Module).

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
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
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
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = var.name
  resource_group = data.ibm_resource_group.group.id
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc_id         = var.vpc_id
  zone           = data.ibm_is_zones.mzr.zones[0]
  public_gateway = var.public_gateway
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group\_id | ID of the resource group to associate with the virtual server instance | `string` | n/a | yes |
| vpc\_id | ID of the VPC where to create the virtual server instance | `string` | n/a | yes |
| address\_count | Number of IPs to assign to Subnet. | `string` | n/a | yes |
| name | Name of the virtual server instance | `string` | n/a | yes |
| zone | VPC zone where the virtual server instance will be created. | `string` | n/a | yes |
| network\_acl | Network ACL to attach to subnet | `string` | `""` | no |
| public\_gateway | Public Gateway to attach to the subnet | `string` | `""` | no | 


## Outputs

| Name | Description |
|------|-------------|
| id | ID of the created Subnet | 
| ipv4_cidr_block | IPv4 CIDR block for the subnet |
| available_ipv4_address_count | Number of IPs in the subnet  | 

