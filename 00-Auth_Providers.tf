terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Japan uses Tokyo Region / SysLog must be stored in Japan / Set Tokyo as the default region no need for alias
provider "aws" {
  /*alias = "tokyo"*/
  region = "ap-northeast-1"
}

provider "aws" {
  alias = "_1Tokyo"
  region = "ap-northeast-1"
}


#Moved below/ New York uses N. Virginia Region
provider "aws" {
  alias = "NewYork"
  region = "us-east-1"
}

#UK uses London
provider "aws" {
  alias = "london"
  region = "eu-west-2"
}

#Brazil uses Sao Paulo Region
provider "aws" {
  alias = "SaoPaulo"
  region = "sa-east-1"
}

# Australia uses Sydney
provider "aws" {
  alias = "sydney"
  region = "ap-southeast-2"
}

#China uses Hong Kong
provider "aws" {
  alias = "HongKong"
  region = "ap-east-1"
}

#California uses N. California
provider "aws" {
  alias = "California"
  region = "us-west-1"
}