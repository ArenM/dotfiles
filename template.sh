#! /usr/bin/env sh

set -a

ESH=vendor/esh/esh
eval "$(./eval-env.sh)"

$ESH "$1"
