#!/bin/sh

# Mount EBS for nexus data
sudo mkfs -t xfs ${nexus_data_device_name}
sudo mkdir ${nexus_data_directory}
sudo mount ${nexus_data_device_name} ${nexus_data_directory}

# Run nexus docker image
docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 --name nexus --user root -v ${nexus_data_directory}:/nexus-data sonatype/nexus3