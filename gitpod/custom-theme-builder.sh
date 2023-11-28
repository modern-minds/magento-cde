#!/usr/bin/env bash

for file in app/design/frontend/*/*; do
  if [ -d "$file/web/tailwind" ]
  then
    mkdir -p "$file/web/css/"
    npm --prefix "$file/web/tailwind" ci
    npm --prefix "$file/web/tailwind" run build-prod
    # cleanup
    rm -rf "$file/web/tailwind/node_modules/"
  fi
done
