# YourProxy

How to make an proxy
https://github.com/robbiehanson/CocoaHTTPServer/issues/70
http://stackoverflow.com/questions/6601536/ios-voip-socket-will-not-run-in-background
https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/AdvancedAppTricks/AdvancedAppTricks.html
https://developer.apple.com/library/ios/documentation/iphone/conceptual/iphoneosprogrammingguide/ManagingYourApplicationsFlow/ManagingYourApplicationsFlow.html

Use CocoaHTTPServer

listen at localhost:18888

make socket(server) as voip mode
https://github.com/robbiehanson/CocoaHTTPServer/blob/master/Vendor/CocoaAsyncSocket/GCDAsyncSocket.h#L890-L915

set plist voip mode

test listening from other app using http://localhost:18888/

try proxying request (http)

try proxying request (https)


Somebody already tried this but no info
https://groups.google.com/forum/#!topic/cocoahttpserver/cvMgUzKWXWA


