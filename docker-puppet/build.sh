#/bin/bash

echo "Building test environment"

docker build -t localhost/puppet-test .

echo "Running the container interactively"

docker run -it -h puppet localhost/puppet-test bash
