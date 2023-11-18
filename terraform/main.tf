terraform {
  cloud {
    organization = "imel"

    workspaces {
      name = "vps"
    }
  }
}
