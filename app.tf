  terraform {
  required_providers {
    bigipnext = {
      source  = "F5Networks/bigipnext"
      version = "1.2.0"
    }
  }
  cloud {
    organization = "39nX-example"

    workspaces {
      name = "39nX-example"
    }
  }
}
variable "host" {}
variable "username" {}
variable "password" {}
provider "bigipnext" {
  username = var.username
  password = var.password
  host     = var.host
}

resource "bigipnext_cm_as3_deploy" "test" {
  target_address = "10.1.1.10"
  as3_json       = file("as3.json")
  }
