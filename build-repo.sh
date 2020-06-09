#!/bin/sh
set -e

echo "** Building repository"
set -x

hhvm --hphp -t hhbc --module vendor --module src --ffile run.hack \
  --output-dir tmp \
  --file-cache tmp/file.cache

set +x

echo "** Listing outputs"
ls -lh tmp
