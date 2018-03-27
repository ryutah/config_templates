import UglifyJsPlugin from "uglifyjs-webpack-plugin";
import config from "./webpack.base.config.babel";
import merge from "webpack-merge";

export merge(config, {
  mode: "production",
  plugins: [
    new UglifyJsPlugin({
      // if need save license after ugilify
      // output: {
      //   comments: uglifySaveLicense,
      // },
      // if need save comment after ugilify
      // comments: true,
      compress: {
        warnings: false
      }
    })
  ]
})
