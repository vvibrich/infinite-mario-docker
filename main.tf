provider "local"{
# credentials = "${file("mario-app-da04539b01ae.json")}"
# project     = "mario-app-239322"
# region      = "us-west1"
}
# Start a container
resource "docker_container" "application" {
  image = "${docker_image.application.latest}"
  must_run = true
  name  = "application"
     ports {
        internal = 8080
        external = 8080
        }
}

# Find the latest Ubuntu precise image.
resource "docker_image" "application" {
  name = "pengbai/docker-supermario"
}
