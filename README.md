# Terraform AWS Redshift Network Module

This Terraform module provisions comprehensive network resources within an AWS VPC, aimed at facilitating a robust, production-ready networking environment. It automatically sets up an Internet Gateway, associated Route Tables, multiple Subnets based on user definitions, Route Table Associations for these subnets, and a dedicated Redshift Subnet Group. This configuration supports high availability, scalability, and segmentation of cloud resources.

## Features

- **Internet Gateway Creation**: Establishes an internet gateway to provide access between the internet and the VPC.
- **Subnet Management**: Dynamically creates multiple subnets based on input definitions, which allows for detailed network segmentation.
- **Route Tables and Associations**: Automatically manages route tables and their associations to subnets, ensuring proper network routing.
- **Redshift Subnet Group**: Configures a subnet group specifically for Redshift clusters, enhancing database performance and security within AWS.

## Usage

Below is an example of how to include this module in your Terraform configuration to set up network resources:

```hcl
module "aws_network" {
  source = "path/to/module"

  vpc_id = "vpc-123abc"
  subnet_definitions = [
    {
      cidr_block        = "10.0.1.0/24",
      availability_zone = "us-east-1a",
      name              = "subnet-one"
    },
    {
      cidr_block        = "10.0.2.0/24",
      availability_zone = "us-east-1b",
      name              = "subnet-two"
    }
  ]
}
```

## Requirements

- Terraform 1.9.2+
- AWS provider

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs

- `vpc_id`: ID of the VPC where network resources will be deployed.
- `subnet_definitions`: A list of subnet definitions, each including CIDR block, availability zone, and a name.

## Outputs

- `subnet_ids`: List of IDs for the created subnets.
- `route_table_id`: ID of the created route table.
- `subnet_group_name`: Name of the created Redshift subnet group.

## License

Distributed under the Apache 2.0 License. See `LICENSE` file for more information.

## Authors

- **John Mharlou N. Maturan**
