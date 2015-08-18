# jSocket ActionScript 3 Compilation #

If for some reason you want to compile the swf files yourself you can always download the flex sdk.

[Download Adobe Flex SDK](http://www.adobe.com/cfusion/entitlement/index.cfm?e=flex3sdk)

Use the following code to compile both the swf files.
```
mxmlc.exe jSocket.as -o jsocket.swf
mxmlc.exe jSocketAdvanced.as -o jsocket.advanced.swf
```
Note: if you haven't added de flex binaries to the system PATH you need to enter the full path for the location of mxmlc.exe