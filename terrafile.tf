module "server" {
  source = "./servers"
  servers = 1 #Variable declared in servers folder (variable.tf)
  # we can define a specific provider to use in this module with aliaster
  # providers = {
    # aws = "aws.usw2"
  # }
}

output "ip_address" {
  value = module.server.ip_address
}