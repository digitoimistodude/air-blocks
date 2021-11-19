module.exports = {
  ignorePatterns: ['content/themes/air-blocks/js/dist/*.js', 'content/themes/air-blocks/node_modules/**/*.js', 'temp.js', 'content/themes/air-blocks/js/src/front-end.js', '**/gulp/**/*.js', '**/gulp/*.js', 'gulpfile.js'],
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
