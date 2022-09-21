terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    template = {
      source = "hashicorp/template"
    }
  }

  required_version = ">= 1.2.0"
}
