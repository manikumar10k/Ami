packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "e2esa-aws-ubuntu"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami = "ami-053b0d53c279acc90"
  ssh_username = "ubuntu"
}

build {
  name = "e2esa-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
