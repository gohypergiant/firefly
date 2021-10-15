source "amazon-ebs" "firefly" {

    ami_name        = var.ami_name
    instance_type   = var.instance_type
    region          = var.aws_region
    skip_create_ami = var.skip_create_ami

    assume_role {
        role_arn     = "arn:aws:sts::499504614116/AWSReservedSSO_PowerUserAccess_5ffa62a0c9832390"
        session_name = "firefly_packer"
    }

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.20211001.1-x86_64-gp2"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ubuntu"
}
