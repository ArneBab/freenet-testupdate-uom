# Test UOM test script

Run the update over mandatory test script, along with all preparations it needs.

This requires pyFreenet installed and a node with FCP running on 9481.

## Usage

    ./run.sh

Then open http://127.0.0.1:8890/friends/

You will be asked twice whether you want to update (each only after some time).

The whole test should take less than 30 minutes.

## Note

This script will do lots of accesses over the network, so it is not suited for anonymous development. It might, however, be useful by showing which information and data is needed for running the full tests.
