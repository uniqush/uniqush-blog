Date: 2012-08-10
Title: New Feature: push with wildcard
Tags: news, uniqush-push
Slug: wildcard
Category: news

NOTE: This feature is included in version 1.3.1 and later. Please check out our latest release from the [download page](http://uniqush.org/downloads.html).

I would like to announce a new feature in uniqush-push: wildcard. More precisely, the asterisk sign (\*).

Just like wildcard in UNIX system, you can use asterisk sign (\*) to match zero or more characters to specify more than one subscribers.

Here is an example (again, I use curl to demostrate. Of course, you can use any language with HTTP library to communicate with uniqush-push):

    curl http://127.0.0.1:9898/push -d service=myservice -d subscriber=uniqush.* -d msg=”Hello World”

This command will push a notification to any subscriber whose name starts with "uniqush."

And of course, if you like, you can use this feature to push message to *all* subscribers:

    curl http://127.0.0.1:9898/push -d service=myservice -d subscriber=* -d msg=”Hello World”

This is a very useful feature if you want to classify your subscribers in groups. For example, I have two groups, namely group1 and group2. We can have a naming convention, say all subscribers under group1 should have names start with "group1.". If we want to send a message to all subscribers in group1, we can simply say, send it to group1.\*. It's very easy and convinient.

One side effect brough by this feature is a more strict naming rule for services and subscribers. Any service/subscriber's name should only contain: 26 English letters (a-z and A-Z), numbers, dash (-), underscore (\_), dot (.). In short, it should match this regular expression: "^[a-zA-Z0-9-\_\\.]+$". Any other character should not be used in service/subscriber's name.

NOTE: Asterisk sign (\*) is the only wildcard we support right now. I see no reason to support more wildcast at this time (like ?, [], etc.). If you have any comment/suggestion, it would be more than welcome.

