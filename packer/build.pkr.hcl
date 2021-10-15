build {
  sources = ["source.amazon-ebs.firefly"]


  provisioner "shell" {
    script = "./scripts/install.sh"
    
  }

  provisioner "shell" {
    script = "./scripts/build.sh"
  }
}
