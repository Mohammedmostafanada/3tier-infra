terraform {
  backend "s3" {
    bucket       = "my-tf-project-state-bucket"   #terraform state S3-Bucket name
    key          = "prod/terraform.tfstate"        #path to the state file in the S3 bucket
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true                          #enable lockfile for state management
}
}