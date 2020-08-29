
# This images AMI IaaSWeek-806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44 was created in aws region us-east-1 if you use other region
# maybe will not find them
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    # Value in String Template expression
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["178520105998"] # User IAM of Image IaaSWeek-806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44
}

resource "aws_instance" "web" {
  count         = var.environment == "production" ? 2 + var.plus : 1 #Conditional with sum if environment = production
  # count         = var.production ? 2 : 1 # We can create an environment production with default true and the condition stay this way
  ami           = data.aws_ami.ubuntu.id #"ami-0d359437d1756caa8"
  instance_type = "t2.micro"

  #Dynamic Block
  dynamic "ebs_block_device" { # The name between quotes must be equal to the resource to be created
    for_each = var.blocks # Data from terraform.tfvars
    content {
      device_name = ebs_block_device.value["device_name"]
      volume_size = ebs_block_device.value["volume_size"]
      volume_type = ebs_block_device.value["volume_type"]
    }
  }  
 
 # Value in String Template expression
 tags = {
    #Name = "HelloWorld ${var.name}"
    # Using String Template with Directives. In this example the default is diffrent of gomex, then the value is unamed
    Name = "Hello %{ if var.name == "gomex"}${var.name}%{ else } unamed%{ endif }"
  }
}
