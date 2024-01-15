#!/bin/bash

PST=$(TZ=":America/Los_Angeles" date -R +%H:%M)
EST=$(TZ=":America/New_York" date -R +%H:%M)
CET=$(TZ=":Europe/Warsaw" date -R +%H:%M)
echo "PST: $PST | EST: $EST | CET: $CET"
