#!/bin/bash

echo "Installing openHAB2..."

# using openHAB2 alpha2 distribution
# follow redirects and ignore unsecure certs
curl --insecure --location -s -o openhab-2.0.0.alpha2-demo.zip https://bintray.com/artifact/download/openhab/bin/openhab-2.0.0.alpha2-demo.zip
