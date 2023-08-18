terraform {
  backend "s3" {
    bucket = "e563yx3f-valheim-terraform-state" # see output from remote_state
    key    = "terraform/state"
    region = "us-east-1"
  }
}