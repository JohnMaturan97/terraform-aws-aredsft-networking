variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_definitions" {
  type = list(object({
    cidr_block        : string
    availability_zone : string
    name              : string
  }))
  description = "List of subnet definitions"
}
