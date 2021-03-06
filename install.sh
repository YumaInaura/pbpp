#!/usr/bin/env bash -eu

readonly eco_install_path=${ECO_INSTALL_PATH:-"$HOME/eco"}

./build_bin

if [[ ! -z "$eco_install_path" ]] && [[ ! "$eco_install_path" =~ /\//  ]]; then
  rm -rfv "$eco_install_path/"
fi

mkdir -p "$eco_install_path/eco"

readonly current_directory=$(echo "$0" | sed -e "s/\/$(basename "$0")$//g")

cp -rfv "$current_directory"/bin "$eco_install_path/"
cp -rfv "$current_directory"/fbin "$eco_install_path/"
cp -rf "$current_directory"/.eco "$eco_install_path/"

cat <<"MESSAGE"
===========================================
Installed
===========================================
Add PATH in your profile file
===========================================
source $HOME/eco/.eco
MESSAGE

