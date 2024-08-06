## Requirements
* Single web application - technology stack not specified
* Application should be kept in a High Availability (HA) approach
* Needs connection to an SQL database and read/write access to blob data
* Should be written in Terraform
* Should consider scalability and security

## Assumptions
* Application can be deployed with App Engine Standard:
    * Free Quota and scaling to zero instances can reduce cost
    * Load balancing and security provided by GCP
    * Can scale on-demand and handle traffic spikes
    * Secure connection with TLS (custom certificate can be added on-demand)
    * Built-in monitoring and logging features
    * Using a simple app from here: [https://github.com/GoogleCloudPlatform/python-docs-samples/tree/main/appengine/standard_python3/cloudsql](https://github.com/GoogleCloudPlatform/python-docs-samples/tree/main/appengine/standard_python3/cloudsql)
* Application needs a database:
    * Cloud SQL PostgreSQL can be created by Terraform
    * We can secure Cloud SQL connection by using private IP or even create a secure tunnel with Cloud SQL Auth Proxy
    * Cloud SQL can be run in HA mode (only applies to a single region)
* Application needs file storage:
    * We can use Cloud Storage
    * Assuming that data is frequently accessed, the STANDARD storage class is the best option - cost effective
    * Storage can be located in the EU region across multiple regions for a Disaster Recovery Plan

## TODO
* A dedicated service account for app engine application should be created with principle of least privilege roles or permissions
* App engine can deployed by terraform
* Python flask app need implementation to write/read files from Cloud Storage
* Google API for CloudSQL, Cloud Build, Cloud Storage, App egnine should be enabled by terraform
* App engine need additional configuration for firewall, scaling (e.g.)