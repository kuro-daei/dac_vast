config = {
  entry: {'index.js': './src/main.js'},
  output: { filename: '[name]' },
  plugins: [ ],
  devtool: 'source-map',
  module: {
    loaders: [
      {
        test: /\.js$/,
        loaders: ['babel-loader?presets[]=es2015'],
        exclude: /(node_modules)/
      }
    ]
  },
};
module.exports = config;
