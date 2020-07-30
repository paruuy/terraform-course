
# This images AMI IaaSWeek-806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44 was created in aws region us-east-1 if you use other region
# maybe will not find them
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["178520105998"] # User IAM of Image IaaSWeek-806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id #"ami-0d359437d1756caa8"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
