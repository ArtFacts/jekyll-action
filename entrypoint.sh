#!/bin/sh
set -e

if [ -n "${INPUT_JEKYLL_ENV}" ]; then
      echo "::debug::Environment is set via input parameter"
  else
      echo "::debug::Environment default in use - production"
      INPUT_JEKYLL_ENV="production"
fi

echo "Installing gems"
bundle config path vendor/bundle
bundle install
echo "Gems installed"

echo "Jekyll building"
JEKYLL_ENV=${INPUT_JEKYLL_ENV} bundle exec jekyll build
echo "Jekyll build done"

