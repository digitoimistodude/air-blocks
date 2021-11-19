# air-blocks
![based_on_air_version 8.1.8_](https://img.shields.io/badge/based_on_air_version-8.1.8_-brightgreen.svg?style=flat-square) ![project_created 18_Nov_2021](https://img.shields.io/badge/project_created-18_Nov_2021-blue.svg?style=flat-square) ![Tested_up_to WordPress_5.8.2](https://img.shields.io/badge/Tested_up_to-WordPress_5.8.2-blue.svg?style=flat-square) ![Compatible_with PHP_7.4](https://img.shields.io/badge/Compatible_with-PHP_7.4-green.svg?style=flat-square)

This project is hand made for customer by Dude.

------8<----------<br>
**Disclaimer:** Please remove this disclaimer after you have edited the README.md, style.css version information and details and screenshot.png. If you see this text in place after the project has been deployed to production,  is in place ;)<br>
------8<----------

## Stack

### Project is based on

* [digitoimistodude/dudestack](https://github.com/digitoimistodude/dudestack)
* [digitoimistodude/air-light](https://github.com/digitoimistodude/air-light)
* [digitoimistodude/devpackages](https://github.com/digitoimistodude/devpackages)

### Recommended development environment

* [digitoimistodude/macos-lemp-setup](https://github.com/digitoimistodude/macos-lemp-setup)

## Theme screenshot

![Screenshot](/content/themes/air-blocks/screenshot.png?raw=true "Screenshot")

## Environments

Green checkmarks show if the environment is already set up and running, red cross indicates if it's not yet there or disabled.

✅  Development: [air-blocks.test](http://air-blocks.test)<br>
❌  Staging: [air-blocks.vaiheessa.fi](https://air-blocks.vaiheessa.fi)<br>
❌  Production: [air-blocks.fi](https://air-blocks.fi/)

## Setting it up initially

According to our handbook, you should have run `createproject`, inital setup by now. Your local server should be up and running.

If you need help, ask your superviser or go back to [dudestack-instructions](https://github.com/digitoimistodude/dudestack-instructions) / [Dude handbook](https://handbook.dude.fi/wordpress-kehitys/projektin-aloitus) and read what you have do.

If local development environment is indeed running, you're ready to version control the project.

There are npm packages in both project root and theme folder. If you come later to this project, please go through [handbook](https://handbook.dude.fi/wordpress-kehitys/projektin-aloitus#myohemmin-projektiin-mukana-tulevan-devaajan-tehtavat) and run:

1. `composer install` (in project folder)
2. `npm install` (in project folder)
2. `npm install` (in theme folder)

Run watcher task with `gulp` and start developing. Most of all, have fun working!
