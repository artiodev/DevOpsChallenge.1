variable "ecr_name" {
    description = "test"
    type = any
    default = null
}

variable "image_mutability" {
  description = "test"
  type = string
  default = "IMMUTABLE"
}

variable "encrypt_type" {
  description = "test"
  type = string
  default = "KMS"
}

variable "tags" {
  description = "test"
  type = map(string)
  default = {}
}

variable "region" {
  description = "Region"
  type = string
  default = "eu-central-1"
}

variable "prop_tags" {
  description = "Tags"
  type = map(string)
  default = {
      Project = "Codebuild Terraform"
      IaC = "Terraform"
  }
}

variable "account_id" {
  description = "AWS Account ID"
  type = string
}

variable "codebuild_name" {
  description = "Codebuild project name"
  type = string
  default = "codebuild-demo-terraform"
}

variable "codebuild_params" {
  description = "Codebuild parameters"
  type = map(string)
}

variable "environment_variables" {
  description = "Environment variables"
  type = map(string)
}