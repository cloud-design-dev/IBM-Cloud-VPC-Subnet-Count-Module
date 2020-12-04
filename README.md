# ibm-vpc-subnet-count-module
Terraform module for creating a VPC Subnet in IBM Cloud based on the `total_ipv4_address_count` option. 

## Variables 
 - **resource_group:** The Resource Group name. This gets used as a data source for the deployed resources.
 - **variable name:** Name that gets assigned to the subnet.
 - **variable address_count:** Number of IPs to assign to the subnet. Default is `256`.
 - **variable network_acl:** The Network ACL to assign to the subnet. 
 - **variable public_gateway:** The public gateway to attach to the subnet.
 - **variable vpc_id:** VPC to target for new subnet. 

## Outputs
 - **id:** The ID of the created subnet.
 - **ipv4_cidr_block:** The IPv4 CIDR block for the newly created subnet. 
