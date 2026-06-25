/* terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.32.0" # Replace with your specific older version
    }
  }
}
*/

/*
provider "google" {
  credentials = file("key.json")
  project     = "terrafrom-496310"
  region      = "us-central1"
  zone        = "us-central1-a"
  #credentials = "key.json"
}
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}