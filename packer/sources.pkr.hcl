source "amazon-ebs" "firefly" {
    # use the `name` field to name a build in the logs.
    name          = var.build_name
    ami_name      = var.ami_name
    instance_type = var.instance_type
    region        = var.aws_region

    assume_role {
        role_arn     = "arn:aws:sts::499504614116/AWSReservedSSO_PowerUserAccess_5ffa62a0c9832390"
        session_name = "firefly_packer"
    }

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}