#!/bin/sh

current_path=$(pwd)

alfred_path="$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences"

cd "$alfred_path" || exit

zip -r workflows.zip "workflows"

mv workflows.zip "$current_path/workflows.zip"
