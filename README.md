# Hugocloud ~ Hugo CMS Operations
_(alpha version)_

<!-- TOC depthFrom:2 -->
- [1. Rationale](#1-rationale)
- [2. Server Installation](#2-server-installation)
    - [2.1. Add system packages](#21-add-system-packages)
	  - [2.1.1 Security considerations](#211-security-considerations)
	- [2.3. Add Website](#23-add-website)
	  - [2.3.1 Content pre processing](#311-content-pre-processing)
- [4. Apache-Web-server-config](#4-apache-web-server-config)
- [5. Nginx-Web-server-config](#5-nginx-web-server-config)
- [5. Milestones](#5-milestones)
- [6. Resources](#6-resources)


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
 
### 2.1. Add systemd packages

TADA

Performs a general basic OS install with the required tooling & relevant debian packages (SSH,git... ) as Hugcloud requirement:

``` bash
add-system-packages.sh
```

#### 2.1.1 Security considerations

TADA

fail2ban
ufw / firewall

### 2.2 Configure Web server

TADA

> NOTE see below ( 4. and 5. section )

### 2.3. Add Website

Performs a general basic import (copy)  and migration (YAML changes)  of the required:

``` bash
add-website.sh
```

#### 2.3.1 Content pre processing

TADA

see _Notes/content-import_ ...

- [3. Apache-Web-server-config](#4-apache-web-server-config)
- [4. Nginx-Web-server-config](#4-nginx-web-server-config)



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














