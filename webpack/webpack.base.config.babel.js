import path from "path";

export default {
  entry: path.join(__dirname, "../src/app.js"),
  output: {
    publicPath: "/",
    path: path.join(__dirname, "../public"),
    filename: "bundle.js"
  },
  // when want to export multiple entry
  // entry: {
  //   app: "./app.js",
  //   search: "./search.js"
  // },
  //
  // output: {
  //   filename: "[name].bundle.js",
  //   path: path.join(__dirname, "public"),
  // },

  target: "web",
  resolve: {
    extensions: ["*", ".js", ".jsx"]
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "babel-loader"
          }
        ]
      }
    ]
  }
};
