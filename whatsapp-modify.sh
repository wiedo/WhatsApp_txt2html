#!/bin/bash

mv _chat.txt chat.html
awk '$0="<p>"$0"</p>"' chat.html > chat2.html
rm chat.html

#regex jpgs
gawk 'match($0,/(.*)((19|20)[0-9]{2}-.*\.jpg)(.*)/,a) {
    $0=a[1] "<a href=\"" a[2] "\">" a[2] "</a>" a[4]
} 1' chat2.html > index.html
rm chat2.html

#add lightbox js to the top of the document:
echo '<link href="http://cdn.rawgit.com/noelboss/featherlight/1.7.5/release/featherlight.min.css" type="text/css" rel="stylesheet" /><script src="http://code.jquery.com/jquery-latest.js"></script><script src="http://cdn.rawgit.com/noelboss/featherlight/1.7.5/release/featherlight.min.js" type="text/javascript" charset="utf-8"></script><script>$(function(){$("a").featherlight();});</script>' >> index.html
