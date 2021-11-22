/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:33
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-22 18:38:05
 */
module.exports = {
  root: true,
  ignorePatterns: ['content/themes/air-blocks/js/dist/*.js', 'content/themes/air-blocks/node_modules/**/*.js', 'temp.js', '**/gulp/**/*.js', '**/gulp/*.js', 'gulpfile.js'],
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
