import config from "./webpack.base.config.babel";

const devConfig = {
  mode: "development",
  devtool: "inline-source-map",
  devServer: {
    inline: true,
    contentBase: "./public",
    port: "3000",
    host: "0.0.0.0"
  }
};

export default Object.assign({}, config, devConfig);
