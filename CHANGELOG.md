### 1.1.6: 2022-06-26

* Add 88 block icons

### 1.1.5: 2022-06-26

* Disable replaces that slow the script down
* Use the same script version than the release (1.2.3 is 1.1.5 from now on)

### 1.1.4: 2022-06-10

* Fix an issue where carousel crashes if last item on the page is not a block but for example a footer instead
* Update block library demo swiper version to 8.2.3

### 1.1.3: 2022-06-10

* Do not add skip-link for carousels in editor view

### 1.1.2: 2022-06-09

* Improve carousel block accessibility: Add aria-hidden toggles
* Add skip link to carousel block
* Add support for multiple carousel blocks
* Add support for carousel block with a scrollbar

### 1.1.1: 2022-06-07

* Change to native `loading="lazy"`

### 1.1.0: 2022-06-07

* Make Swiper carousel more accessible

### 1.0.9: 2022-05-24

* Fix swiper not initting in gutenberg editor js

### 1.0.8: 2022-05-24

* Bump required version up to 8.4.2 because of the refactored JS in Air-light
* Replace slick with swiper in carousel block
* Fix: Add missing file format .svg for carousel SVG
* Deprecate slick-carousel as per air-light 8.4.7
* Rewrite demo JS to be consistent with air-light after refactoring in v8.4.2
* Add 'prevent_cache' => true to form block
* Add file header descriptions to each block files
* Add content block to importer
* Fix situation that produces extra files with -e suffix
* Add localizations for all block titles

### 1.0.7: 2022-02-24

* Add form block importer script
* General fixes
* Fix sed: functions.php: No such file or directory when trying to import existing block
* Ensure that tmpfiles are deleted when they are no longer needed
* Drop heading-block-small() and heading-block-normal() components to simplify the process
* Build form importer

### 1.0.6: 2022-02-22

* Fix adding block class to new block
* `newblock`: Add content-columns-50-50
* Add separate post-block tasks for empty-block, fix functions.php replacement task

### 1.0.5: 2022-02-11

* New feature: You can now add new empty starters for your new blocks

### 1.0.4: 2022-02-10

* Fix 5.9 related WSOD
* Disable air-helper media directory hook as it breaks things in production
* Fix hero block labels in front end
* `newblock`: Add accordion
* `newblock`: Add carousel
* New feature: Activates the block ACF fields automatically (no extra step with "Sync available" > Import)

### 1.0.3: 2022-02-08

* Multiple bugfixes
* New block: Content
* New block: Accordion
* New block: Hero small image
* New block: Hero big image
* Hero block improvements
* Demo improvements 
* Check supported Air-light theme version when running block importer
* Check if theme supports Gutenberg + ACF blocks
* Major rehaul to newblock logic, add generic commands to get-block.sh
* `newblock`: Register ACF block in functions.php
* `newblock`: List available blocks
* `newblock`: Localizations
* Change block selection to number based selection
* Make lang selection consistent by number
* Rename hero block to 'hero-full-height'
* Run tests for the first block script, improve tasks

### 1.0.2: 2021-12-21

* New block: Carousel
* New block: Form
* New block: Image and content
* New block: Image content columns
* New block: Icon content columns
* New block: Quote
* New block: Content columns 50/50
* New block: Content columns with title
* Hero block improvements
* Improve carousel demo in mobile
* Carousel fixes, fix carousel demo overflow
* Improve count of blocks by filtering
* Add autocomplete feature
* Fix block name tag showing only first part before dash
* Fix block field layouts in wp-admin
* Filtering improvements, clear filtering on cancel

### 1.0.1

* First working draft of the `newblock` script
* Fix block name tag class and transition
* Add Inter font weights
* Add block amount counter with real time filtering

### 1.0.0

* Open changelog