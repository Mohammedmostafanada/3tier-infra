terraform {
  required_version = "~> 1.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.53"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "~> 5.3"
    }
  }
}

provider "vault" {
  address = "http://44.193.145.136:8200"
}

# Fetch the secrets ephemerally (in-memory only)
ephemeral "vault_kv_secret_v2" "aws_creds" {
  mount = "secret"
  name  = "aws"
}

provider "aws" {
  region     = "us-east-1"
  access_key = ephemeral.vault_kv_secret_v2.aws_creds.data["access_key"]
  secret_key = ephemeral.vault_kv_secret_v2.aws_creds.data["secret_key"]
}
