#!/bin/sh

set -x

# Run the Freenet update test script

# This requires pyFreenet installed and a node with FCP running on 9481

if ! which fcpupload; then
    echo "The test needs pyFreenet installed and a Freenet node with FCP running on 9481. See
        - https://github.com/freenet/pyFreenet/ and
        - https://freenetproject.org" 1>&2
    exit 1
fi

# get the repositories
git clone https://github.com/freenet/java_installer.git
git clone https://github.com/freenet/fred.git
git clone https://github.com/freenet/scripts.git

# fetch all branches with git complexity
cd fred
git remote add toad https://github.com/toad/fred-staging.git
# thank you, stackoverflow: http://stackoverflow.com/a/10312587/7666
for remote in $(git branch -r); do git branch --track $remote; done
# get all data
git fetch --all
# update all local branches
git pull --all
cd -

# prepare fred build
echo "lib.contrib.get = true" > fred/override.properties
mkdir -p fred/lib
wget -O fred/lib/bcprov-jdk15on-152.jar https://downloads.freenetproject.org/latest/bcprov-jdk15on-152.jar

# run the updater
cd scripts
./test-autoupgrade
cd -
