Description
=========
myJanitor is a GUI for Netflix Janitor Monkey, which is a part of their Simian Army application. It can keep track of your unused AWS resources and help you to terminate them. Here is the <a href='https://github.com/Netflix/SimianArmy/wiki/Janitor-Home' target='_black'> Janitor Monkey Home </a>. The basic process is "Mark, Notify, Delete", first it goes throught all your aws resrouce, finds some unused resources under the rule you specified and marks them, then send you notifications if it deciedes to delete that marked resource, after some time, the resource will be deleted automatically. Also, you can unmarked the resouce to make it not be deleted yourself. 

Start to use it
============
1) First you need to have a AWS account that has SimpleDB service, and create a domain called SIMIAN_AMRY, and has an SES email address been set up. 

2) Put the directiory under Apache Tomcat,set up the Coniguration under /WEB-INF/classes, you just need to set client.propreties, simianamry.propreties and junitor.propreties,if you don't know how to set, look <a href='https://github.com/Netflix/SimianArmy/wiki/Configuration' target='_blank' >here</a>, then run the server. 

3) If you want to use it with Edda(another tool by Netflix), you should keep it run on another server, then in the janitor.propreties, set the endpoint to the running url of your edda. 

Screeshot 
================
https://docs.google.com/document/d/1eIjDzx2IL6LpGvdehnmW7XOYC7ZNtTz1H4NfNEYqNSg/edit?usp=sharing


Contact
==========
Email: xiaoma318@yahoo.com
