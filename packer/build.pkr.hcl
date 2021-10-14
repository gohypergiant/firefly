build {
  sources = ["source.amazon-ebs.firefly"]

  provisioner "shell" {
    script = "./build.sh"
  }
}
