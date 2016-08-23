var webpack = require("webpack");
var path = require("path");

const ROOT_DIR = path.resolve(__dirname, "public");

module.exports = {
    debug: true,
    entry: {
        vendor: path.join(ROOT_DIR, "js/vendor.js"),
        app: path.join(ROOT_DIR, "js/bootstrap.jsx")
    },
    output: {
        //path: path.join(__dirname, "dist"),
        filename: path.join(ROOT_DIR, "js/dist/[name].bundle.js")
    },
    devtool: "source-map",
    module: {
        preLoaders: [
            {
                test: /\.jsx?\$/,
                exclude: /(node_modules|bower_components)/,
                loader: "jsxhint-loader"
            }
        ],
        loaders: [
            {
                test: /\.css\$/,
                loaders: [ "style", "css", "cssnext-loader" ]
            },
            {
                test: /\.jsx?\$/,
                loader: "babel",
                exclude: /(node_modules|bower_components)/,
                query: {
                    presets: [ "react", "es2015" ]
                }
            }
        ]
    },
    cssnext : {
        features : {
            import : {
                path : [ path.join(ROOT_DIR, "styles") ]
            }
        }
    },
    jshint: {},
    plugins: [
        new webpack.optimize.CommonsChunkPlugin("vendor", path.join(ROOT_DIR, "js/dist/vendor.bundle.js"))
    ]
};