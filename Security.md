# Security #




# Flash #

Flash has some pretty aggressive socket permission systems.
All these systems take place server side and thus are not in the scope of this project.
That said, i do provide you with an example policy file:

[crossdomain.xml](http://jsocket.googlecode.com/svn/trunk/jsocket/flash/crossdomain.xml)

Don't forget that this leaves your server open for requests from every flash application so it should only be used in development.



For more information read:

  * [Policy file changes in Flash Player 9 and Flash Player 10](http://www.adobe.com/devnet/flashplayer/articles/fplayer9_security.html)
  * [Sockets in Flash Player versions later than 9.0.115.0](http://kb2.adobe.com/cps/403/kb403364.html)