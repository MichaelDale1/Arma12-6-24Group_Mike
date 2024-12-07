#declare variables
variable "tokyo_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}

variable "ny_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}


variable "london_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}

variable "SaoPaulo_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}

variable "Sydney_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}

variable "HongKong_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}

variable "california_cidr_blocks" {
    description = "cidr blocks for vpc and subnets"
    type =list (object ({
    cidr_block = string
    name = string
    region = string
    image_id = string
    availability_zone = string
  }))
}