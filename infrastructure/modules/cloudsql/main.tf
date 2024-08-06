resource "random_id" "id" {
  byte_length = 4
  prefix      = var.instance_name
}

resource "google_sql_database_instance" "instance" {
  name             = random_id.id.hex
  region           = var.region
  database_version = "POSTGRES_9_6"
  
  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"
    edition           = "ENTERPRISE"
    disk_autoresize   = false
    disk_size         = 10
    disk_type         = "PD_HDD"
  }
  
  # Not for production env
  deletion_protection  = "false"
}

resource "google_sql_user" "users" {
  name     = var.database_user
  instance = google_sql_database_instance.instance.name
  password = var.database_password
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.instance.name
}