module.exports = {
  ignorePatterns: ['content/themes/dudeblocks/js/dist/*.js', 'content/themes/dudeblocks/node_modules/**/*.js', 'temp.js', 'content/themes/dudeblocks/js/src/front-end.js', '**/gulp/**/*.js', '**/gulp/*.js', 'gulpfile.js'],
  parser: 'babel-eslint',
  extends: 'eslint-config-airbnb/base',
  rules: {
    indent: ['error', 2],
  },
  env: {
    browser: true,
    jquery: true,
  },
};
