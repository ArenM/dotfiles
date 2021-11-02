#! /bin/sh

# The output of this script should be evaluated by anyone who wants the
# environment varibles set for the dotfiles envrionemtn. It is expected to be
# located in the same directory as the env files

base_dir="$(realpath "$(dirname -- "$0")")"

echo ". $base_dir/base-env.sh;"

if [ -e "$base_dir/env.sh" ]; then
  echo ". $base_dir/env.sh;"
fi

echo ". $base_dir/generated-env.sh;"
