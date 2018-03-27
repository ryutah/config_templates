#!/bin/sh

set -ex

npm i -D "babel-loader@^8.0.0-beta" \
  @babel/core \
  @babel/preset-env \
  html-webpack-plugin \
  webpack \
  webpack-cli \
  webpack-dev-server \
  webpack-merge
