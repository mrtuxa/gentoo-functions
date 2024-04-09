merge() {
 doas emerge -a $1 
}

unmerge() {
 doas emerge --unmerge $1
}

addoverlay() {
 doas eselect repository enable $1
 doas emaint sync -r $1
}

addopkg() {
 addoverlay $1
 merge $2
}

addkeyword64() {
 rm -v /tmp/package.accept_keywords
 cp /etc/portage/package.accept_keywords /tmp/package.accept_keywords
 echo  $1 "~amd64" >> /tmp/package.accept_keywords
 doas cp /tmp/package.accept_keywords /etc/portage/package.accept_keywords
}
