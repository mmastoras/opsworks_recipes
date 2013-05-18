spongecell-recipes
===============
This is a repository of some basic recipes for Spongecell using chef to deploy, setup, and configure common tools for Rails applications.

Installation
============

Follow these steps to use custom deployment recipes with your applications.

* Install the spongecell-deploytool gem:
  $ gem install spongecell-deploytool
* cd into spongecell-recipes
  $ cd spongcell-recipes
* run spongetool to upload and apply chef recipes
  $ st chefrun -a <application> -e <environment> -c <upload|apply>
