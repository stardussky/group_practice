module.exports = {
  publicPath: './',
  productionSourceMap: false,
  devServer: {
    overlay: {
      warnings: true,
      errors: true
    },
    disableHostCheck: true
  },
  lintOnSave: process.env.NODE_ENV !== 'production',
  chainWebpack: config => {
    const oneOfsMap = config.module.rule('scss').oneOfs.store
    oneOfsMap.forEach(item => {
      item
        .use('sass-resources-loader')
        .loader('sass-resources-loader')
        .options({
          resources: './src/style/_main.scss'
        })
        .end()
    })
  },
  // eslint-disable-next-line no-dupe-keys
  devServer: {
    proxy: {
      '/php': {
        target: 'http://localhost/php',
        // ws : true,
        changeOrigin: true,
        pathRewrite: {
          '^/php': ''
        }
      }
    }
  }
}
