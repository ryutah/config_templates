import UglifyJsPlugin from "uglifyjs-webpack-plugin";
import config from "./webpack.base.config.babel";

const prodConfig = {
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
};

export default Object.assign({}, config, prodConfig);
