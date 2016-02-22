#!/bin/sh

# Run the Freenet update test script

# This requires pyFreenet installed and a node with FCP running on 9481

# get the repositories
git clone https://github.com/freenet/java_installer.git
git clone https://github.com/freenet/fred.git
git clone https://github.com/freenet/scripts.git


# run the updater
cd scripts

