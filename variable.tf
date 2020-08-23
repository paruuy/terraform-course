variable "hash_commit" {
  type = string
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
  description = "Hash commit of specific aws_ami (linixtips image)"
}

# Define the var withotut default value (if not declares will be error)
variable "environment" {
  type = string
  default = "production"
  description = "Environment variabel to use in ec2.tf"
}

variable "plus" {
  type = number
  default = 2
  description = "Number to increase instances in ec2.tf if environment = production"
}

variable "production" {
  type = bool
  default = true
}
