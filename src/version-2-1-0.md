Date: 2016-03-09
Title: Release 2.1.0
Tags: news, release note
Slug: uniqush-push-2-1-0
Category: news

Please check out our [release notes] for version 2.1.0.

New APIs have been added: one for listing the subscriptions of a subscriber and
another for showing the configurations of the push service providers for services that
exist.

Concurrency issues in ADM and APNS have been fixed. The APNS implementation
has been changed to use a new, reliable worker pool implementation.

This implementation has been running reliably at production scale, at a company named
*if(we)*, sending push notifications for the Tagged and hi5 social networks
for a while now (nearly a year at time of writing).
The company has 12 processes handling a peak of 60 APNS push notifications per second,
and the tier is overprovisioned in order to be able to deal with
traffic increases and potential surges. That's about 5 APNS push notifications
per process per second. In addition, *if(we)* sends about 270 GCM push notifications
per second distributed amongst these same processes, which adds about another
22 GCM push notifications per second each process sends. The subscribe API
on the tier ends up getting hit about 500 times per second (about 42 queries
per process per second). So, each process is handling about 70 queries a second
easily. *if(we)* has been running without any issues for many months, especially after
fixing some bugs that eventually manifested only at their scale.

A bug which could lead to infinite loops in rare circumstances has been fixed.

The APNS implementation no longer uses Go's default HTML escaping of JSON
payloads. The APNS servers now render payloads with characters such as '"'
properly.

More details have been added to error messages so that problems can be
debugged more easily.

The APNS implementation has also been updated to deal with 100-byte APNS
device tokens (previously 32-bytes) which Apple said it would roll out in 2016.

[release notes]: http://uniqush.org/release-notes/rn-uniqush-push-2-1-0.html
[uniqush-push]: http://github.com/uniqush/uniqush-push
