#! /usr/bin/env sh

set -a

ESH=vendor/esh/esh
source ./base-env.sh

$ESH $1
