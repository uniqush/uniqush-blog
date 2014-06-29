Date: 2014-06-29
Title: Release 1.5.2
Tags: news, release note
Slug: uniqush-push-1-5-2
Category: news

*TL;DR*: Please checkout our [release note] for version 1.5.2.

Sorry for my absence since November 2013. I was preparing other things and
working on other projects. During this period, I received several bug reports
related to [uniqush-push]. Some of them indicating some large service is
currently using uniqush-push as their backend push service, while some of them
contains very weird log messages which I did not expect. It is really exciting
for me to see [uniqush-push] working on top of user base with millions of
users. But it is so disappointed that I was not able to quickly found the root
cause of all bugs.

Fortunately, it seems that most bugs are related to the APNS' waiting time
calculation. When a push operation failed, [uniqush-push] will wait for some
time before retry. It will announce a failure after 3 attempts. The waiting
time is increased for each attempt. The way we used to calculate the waiting
time was to square the previous waiting time. The problem is that we represent
time period in terms of nanoseconds. Squaring it quickly leads to an integer
overflow. This is why lots of logs in bug reports contains some negative
waiting times.

There's also a potential problem with deterministic waiting times: It may leads
to message storm. Imagine you want to send one million message at same time and
some of them will fail. Because all of the failed messages will be resent after
the same period, it leads to another spike of network usage, which may lead to
failure as well. An easy fix is to wait for a random amount of time.

In 1.5.2, [uniqush-push] will randomly increase the waiting time before every
resend of a message. This should fix most bug report I received. But I did not
confirmed this with every reporter yet. If you have any other issues with the
most recent version, please [report a
bug](https://github.com/uniqush/uniqush-push/issues/new).

[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-5-2.html
[uniqush-push]: http://github.com/uniqush/uniqush-push
