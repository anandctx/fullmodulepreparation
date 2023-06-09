terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
  required_version = ">=1.0.0"
}

# terraform {

#     backend "azurerm"{

#     }
# }


provider "azurerm" {
  subscription_id = "311efd17-04f8-409d-9e40-16f0a20d05c0"
  tenant_id       = "6003e579-5b95-4193-b771-6ebc80114110"
  client_id       = "9aef5467-ae4c-4894-a74b-06aa67877a0f"
  client_secret   = "3fB8Q~mHtelINAv1CgYD35xHuCVkQJ950Gqo9caV"
  features {
  }

}    