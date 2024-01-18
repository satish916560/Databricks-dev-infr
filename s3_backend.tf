terraform {
  backend "s3" {
    bucket = "dbr-s3-bucket-dev"
    key    = "dbr-dev-ws-terra"
    region = "us-west-2"
  }
}