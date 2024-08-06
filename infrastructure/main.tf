terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

provider "google" {
    project     = var.project 
    credentials = file("key.json")
}

module "storage" {
    source = "./modules/bucket"
    name   = "files-for-simple-app"
}

module "database" {
    source            = "./modules/cloudsql"
    region            = "europe-west3"
    instance_name     = "simple-db"
    database_name     = "simple-app"
    database_user     = var.database_user
    database_password = var.database_password
}