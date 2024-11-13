# Hugocloud ~ Hugo CMS Operations
_(alpha version)_

<!-- TOC depthFrom:2 -->
- [1. Rationale](#1-rationale)
- [2. Server Installation](#2-server-installation)
- [3. Usage](#3-usage)
    - [3.1. Sync content](#31-add-website)
	  - [3.1.1 Pre processing](#311-pre-processing)
    - [3.2. Process YAML](#32-process-yaml)
	  - [3.2.1.  Process multilingual](#321-process-multilingual)
	  - [3.2.2.  Change or update fields](#323-change-or-update-fields)
- [4. Apache-Web-server-config](#4-apache-web-server-config)
- [5. Nginx-Web-server-config](#4-nginx-web-server-config)
- [6. Milestones](#5-milestones)
- [7. Resources](#6-resources)


<!-- /TOC -->


## 1. Rationale

*TLDR* : Hugo Ops. ~  sort of 'Hugo Cloud' prototype 

A DIY / DIWO Hugo easy deploy &amp; (self)hosting ... why not? 


> Now that you have met Hugo (web Framework) ...

 You been, step by step... walking :

- [Hugocodex](https://github.com/jhvanderschee/hugocodex)

- [Hugo Docs.](https://gohugo.io/getting-started/)


We've learned how to rapidly prototype and develop a Hugo based website.

      
## 2. Server Installation 

*You would better*...  rely on Debian 12 (or Ubuntu)  operating system ?

Dependencies  - list .deb packages required

> TADA : list 
 
## 3. Usage 

TADA

### 3.1. Add website

Performs a general basic import (copy)  and migration (YAML changes)  of the required:

``` bash
add-website.sh
```

### 3.1.1. Posts Date processing 


On blogposts, dates need the be processed (defined as front-matter field).

``` 
let's run the posts-date-move2front-matter (existing Bash) script on the posts/ folder
```

> NOTE: see scripts-base/ folder


### 3.2. Process YAML
 
 Let's process the front-matter !

#### 3.2.1. Process multilingual 

There are different source/origin websites/content folders to import and process. Let's add a related 'tag': it will inform about the source/origin.

[see  'Resources' section below](#6-resources)


### My Multi Word Header

#### 3.2.2 Change or update fields


Last but not least, the front-matter ('F-M') needs other changes to be applied on the  YAML. The given sync. content command takes care of, when needed: 
PHP YAML processing takes place.

 E.g. the following pseudo-code (the OPTION is specified parenthesis):

```

- > remove this F-M field 'f' ( -r )

- > change this F-M field name  'f' ( -c )

- > update  this F-M field 'y' value  ( -u )

- > add this F-M field/value pair 'f' ( -a )

- > (going further...) find a YAML nested pattern and operate upon

 it will be done by iterating in all files in the given folder (specified by a PATH )

```

> NOTE1 : under construction ^^ - see migrate-script.php file.


## 4. Apache-htaccess

TADA : the migration requires old URLs to be properly redirected

``` apacheconf
  let's use mod_rewrite Apache capabilities for ! ..
```



- [4. Apache-Web-server-config](#4-apache-web-server-config)
- [5. Nginx-Web-server-config](#4-nginx-web-server-config)



## 5. Milestones
_(ongoing tasks) :_

- [x] Move from Bash to Scripts to Makefiles

- [ ] Lorem re-create / process content when needed ~ front matter sculpting (YAML)
  - [ ] Lorem Ipsum 
- [ ] Sagan Ipsum
  - [ ] Orion nebulas
  - [ ] Proxima Centauri

- [ ] Process to multilingual ? -> when needed
  - [ ] Tranlsate content ? -> when needed



## 6. Resources














