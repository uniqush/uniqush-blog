Date: 2016-03-08
Title: Release 2.0.0
Tags: news, release note
Slug: uniqush-push-2-0-0
Category: news

Please check out our [release notes] for version 2.0.0.

We've improved the response format of most APIs. Instead of sending server logs
back, they now return JSON response objects. This makes it easy to distinguish
successes from failures. For example, when sending push notifications to a subscriber with
multiple delivery points, some may fail, but others may succeed. The JSON response object
for a push contains easily parseable information on the status of each delivery point.

The APNS module has been updated to support the new 2048 byte (2kB) limit.

There are a few bugfixes, fixing both memory leaks and improperly closed connections.

This version officially removes C2DM support entirely, as C2DM was shut down by
Google on October 2015.

The released binaries are built with Go 1.6. Compilation with Go 1.6 (or
whatever the newest version may be) is recommended as the service will have
lower CPU usage compared to builds using older versions of Go.

[release notes]: http://uniqush.org/release-notes/rn-uniqush-push-2-0-0.html
[uniqush-push]: http://github.com/uniqush/uniqush-push
