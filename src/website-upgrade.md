Date: 2012-08-04
Title: Unqiush.org is upgraded
Tags: news, plan
Slug: website-upgrade
Category: news

As we mentioned in the [previous update], the website of [uniqush.org] is now upgraded. All content in previous pages are updated and the whole website is based on static pages generated by [webgen]. Besides, we provide [binary packages] for 64-bit systems, including .rpm, .deb and .tar.gz.

Anohter news is: the [uniqush organization] is working now to replace the old uniqush repository under [my github account]. This change will not affect any function of *uniqush-push*, but will help us to maintain a more organized code base and provide an easy way to contribute.

By the end of August, we will release version 1.3.1, which will provide the following functions:

- *uniqush-push* will support wildcast when you push some notification to subscribers. For example, you can name your subscriber as group1.sub1, group1.sub2, group1.sub3, etc. Then you can say "push message to group1.\*" and the message will be push to all subscribers whose name starting from group1..
- *uniqush-push* will support true multicast. Because [GCM] introduced multicast, we need to support it in native way.

[previous update]: update-2012-07-31.html
[uniqush.org]: http://uniqush.org
[webgen]: http://webgen.rubyforge.org/
[uniqush organization]: http://github.com/uniqush
[my github account]: http://github.com/monnand
[binary packages]: http://uniqush.org/downloads.html

