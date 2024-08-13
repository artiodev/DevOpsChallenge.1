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