locals {
  name-of-resources = [
    {
      vpc  = "192.168.0.0/16"
      dns  = true
      host = true
      name = "Practiceb VPC"
    },
    {
      public = "192.168.30.0/24"
      name   = "Public Subnet"
      enable = true
      azone  = "us-east-2a"
    },
    {
      sec  = "Practiceb Security"
      name = "Allow normal protocols"
      desc = "Tls Security groups for application"
    },
    {
      intern = "Practiceb-InteGataway"
    },
    {
        route = "Practiceb Table"
    }
  ]
}
