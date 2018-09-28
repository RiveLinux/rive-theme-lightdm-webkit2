# == Setup ====================================================================

CleanPlugin          = require("clean-webpack-plugin")
ExtractTextPlugin    = require("extract-text-webpack-plugin")
MiniCssExtractPlugin = require("mini-css-extract-plugin")
CopyPlugin           = require("copy-webpack-plugin")
Webpack              = require("webpack")

Build = require("./lib/Build")
build = new Build(".")

configs = []
module.exports = configs

# == Main configuration =======================================================
#   app/**/*.coffee                   -> build/scripts/app.js
#   app/**/*.{css,scss}               -> build/styles/*.css

configs.push
  entry:  build.entries
  output: build.output
  module:
    rules: [
        test: /\.coffee$/,
        use: ['coffee-loader']
      ,
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              url: false,
            }
          },
          "sass-loader"
        ]
      ,
        test: /\.woff2?$|\.ttf$|\.eot$|\.svg$/,
        use: [{
          loader: 'file-loader',
          options: {
            outputPath: '/fonts/'
          }
        }]
      ,
        test: /\.css$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          "css-loader"
        ]
    ],
  plugins: [
    new CleanPlugin(build.dirs.build.toString()),
    new CopyPlugin([
      build.dirs.src.join("index.theme").toString(),
    ]),
    new MiniCssExtractPlugin(filename: "styles/app.css")
  ]

# == Main views ===============================================================
#   app/views/*.{html,haml} -> build/*.html

for viewPath in build.files.views
  outputFilename    = "#{viewPath.name()}.html"
  extractTextPlugin = new ExtractTextPlugin(outputFilename)

  configs.push
    entry: viewPath.toString()
    output:
      path: build.dirs.build.resolve().toString()
      filename: "#{viewPath.name()}.html"
    module:
      rules: [
        test: viewPath.resolve().toString()
        use: extractTextPlugin.extract(
          use: [
            {
              loader: "haml-loader"
            },
            {
              loader: "string-replace-loader",
              query:
                search: /\+include\s+['"](.+)['"]/,
                replace: "+include 'app/partials/$1.haml'",
                flags: 'g'
            }
          ]
        )
      ]
    plugins: [extractTextPlugin]
