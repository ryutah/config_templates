#!/bin/sh

function build() {
  npx webpack --config ./webpack/webpack.prod.config.babel.js
}

function watch() {
  npx webpack -w --config ./webpack/webpack.dev.config.babel.js
}

function serve() {
  npx webpack-dev-server --config ./webpack/webpack.dev.config.babel.js
}

set -e

$1
