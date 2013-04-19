Cucumber Vagrant Box
==============================

Copyright 2013, Thomas Layh <thomas@layh.com>

Description:
--------------

Will install Cucumber headless including all required setups for the server environment.


Installation:
--------------

1. Setup Ruby and RubyGems on your system.

2. Install Vagrant and Librarian
::
   gem install vagrant
   gem install librarian

3. Install required cookbooks
::
   librarian-chef install

4. Add to your host file
::
   192.168.23.7 cucumber.report

5. Run vagrant
::
   vagrant up

6. ssh
::
   vagrant ssh


7. update
:: 
   cd [somewhere]/Tests/Cucumber/
   svn up
   or 
   git pull ...

9. run
::
   cucumber

or for html report
:: 
   cucumber --format html -o /var/www/cucumber-report/index.html

10. open http://cucumber.report/