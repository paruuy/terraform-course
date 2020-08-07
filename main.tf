provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
  alias   = "usw2"
}
#Este backend remoto e bom quando o terraform se usa em varios lugares
# Porque ai ficarao os dados 
terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    #bucket = "pmrm-tfstates-terraform" # bucker regiao eu-central
    bucket = "pmrm-us-bucket-terraform" # Bucket regiao us east
    key    = "terraform-test.tfstate"
    region = "us-east-1"
    encrypt = true #encriptar dados sensiveis in S3
  }
}