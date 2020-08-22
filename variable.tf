variable "hash_commit" {
  default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

# Define the var withotut default value (if not declares will be error)
variable "environment" {
  default = "production"
}

variable "plus" {
  default = 2
}

variable "production" {
  default = true
}