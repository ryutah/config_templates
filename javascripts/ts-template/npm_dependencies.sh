#!/bin/sh

set -ex

# babel-preset-envは `@babel/preset-env` を使いたいけど `ts-loader` とコンフリクトする

npm i -D babel-preset-env \
  html-webpack-plugin \
  ts-loader \
  typescript \
  webpack \
  webpack-cli \
  webpack-dev-server \
  webpack-merge
