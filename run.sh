#!/bin/sh

# Run the Freenet update test script

# This requires pyFreenet installed and a node with FCP running on 9481

if ! which fcpupload; then
    >&2 echo "The test needs pyFreenet installed and a Freenet node with FCP running on 9481. See
        - https://github.com/freenet/pyFreenet/ and
        - https://freenetproject.org"
    exit 1
fi

# get the repositories
git clone https://github.com/freenet/java_installer.git
git clone https://github.com/freenet/fred.git
git clone https://github.com/freenet/scripts.git


# prepare fred build
echo "lib.contrib.get = true" > fred/override.properties
mkdir -p fred/lib
wget -O fred/lib/bcprov-jdk15on-152.jar https://downloads.freenetproject.org/latest/bcprov-jdk15on-152.jar

# run the updater
cd scripts
./test-autoupgrade
cd -
