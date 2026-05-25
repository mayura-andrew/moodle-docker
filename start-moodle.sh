#!/bin/bash
set -e

echo "Setting environment variables..."
export MOODLE_DOCKER_WWWROOT=$(pwd)/moodle
export MOODLE_DOCKER_DB=mariadb

echo "Copying config template..."
cp config.docker-template.php $MOODLE_DOCKER_WWWROOT/config.php

echo "Starting Moodle Docker containers..."
bin/moodle-docker-compose up -d

echo "Waiting for the database to initialize..."
bin/moodle-docker-wait-for-db

echo "Success! The database is ready and containers are running."

