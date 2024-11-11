# Possible setups for Hugo Cloud

1. Usecue CMS and Usecue's Hugo Cloud (super fast deploys, trust issue)
2. Usecue CMS and another Hugo Cloud (fast deploys, paid)
3. CloudCannon without Hugo Cloud (fast deploys, paid)
4. Github Pages without a CMS (slow deploys, free)

## Why choose which?

Getting users on Usecue's Hugo Cloud (option 1) is not really a priority. Getting users on option 2 or option 3 is something we can offer. Option 4 is in there as a reference.

## Most likely setup (option 2)

This repo is all about this option. Every code change in Github (or Gitlab) fires a webhook that instructs the CMS to pull the latest version of the website. Every CMS change gets pushed to the Hugo Cloud (called production). The owner of the website can push to Github and push to production. These two repositories has to be kept in sync.

