Date: 2013-07-20
Title: Release 1.4.4
Tags: news, release note
Slug: uniqush-push-1-4-4
Category: news

This version contains some minor bug fixes and a *huge* improvement for APNS. I
would like to give special thanks to [cmabastar-gumi] for his detailed bug
reports. Please check the [release note] for detailed ChangeLog.

In this post, I will explain more about how I improved the performance for
APNS.

### Overview

Both [issue 24] and [issue 27] described a poor performance when pushing
notification through APNS. After a brief profiling, I made three changes:

- Checking [Feedback Service] less frequently.
- Using a [connection pool] to send notifications in parallel.
- Response the request immediately after sending the notification, without
  waiting for the error response from APNS.

### Checking feedback service less frequently

Starting from version 1.4.2, *uniqush-push* supports [Feedback Service] for
APNS. Both version 1.4.2 and version 1.4.3 have a very naive approach
for [Feedback Service]: *uniqush-push* checks feedbacks after every
push operation. This is very inefficient because it has to establish a new
TCP connection every time.

In version 1.4.4, *uniqush-push* checks the feedback for every 10 minutes.
Although it may be better to provide a parameter for user to set this time
interval to other values, I see no strong benefit by providing this parameter.
At this point of time, I would rather use a constant time interval (10 minutes)
and keep a simple interface for users.

### Using connection pools

Before version 1.4.4, *uniqush-push* maintains one single connection with APNS
for each APNS key/certificate pair. Clearly, using a connection pool could
improve the performance when we have concurrent request, since we can send
notifications in parallel through several TCP connections. However, APNS'
document does not clearly say how many connections we can have for each
key/certificate pair. According to [discussion on
stackoverflow](http://stackoverflow.com/questions/9086956/what-is-the-number-of-persistent-connections-to-apns-allowed),
15 connections would be find in most cases. In version 1.4.4, we use at most 13
connections for each key/certificate pair.

As a byproduct, a general [connection pool library] in Go is available on github.

### No wait for the error response

OK. This is a trade off we made here. As an asynchronous service, APNS cannot
guarantee the response time for the error response. What's worse, it does not
even guarantee that there will be a response.

Fortunately, most errors can be checked before sending notifications to APNS.
In version 1.4.4, *uniqush-push* returns success immediately once the
notification has been sent to APNS. Some error like *invalid token* can be
processed later inside *uniqush-push*. In most cases, we are good.

### Conclusion

After making the changes above, the performance for APNS is improved ~100x.
Let's quote [cmabastar-gumi]'s test results mentioned in reply to [issue 27]:

> we were able to send 22k messages in less than 3mins and we were also able to
> test around 68k users to be subscribed in around 5mins. Thanks for this
> build! It's damn fast!

[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-4-4.html
[uniqush-conn]: http://github.com/uniqush/uniqush-conn
[cmabastar-gumi]: https://github.com/cmabastar-gumi
[blog]: http://blog.uniqush.org
[connection pool]: http://github.com/uniqush/connpool
[connection pool library]: http://github.com/uniqush/connpool
[issue 19]: https://github.com/uniqush/uniqush-push/issues/19
[issue 24]: https://github.com/uniqush/uniqush-push/issues/24
[issue 25]: https://github.com/uniqush/uniqush-push/issues/25
[issue 26]: https://github.com/uniqush/uniqush-push/issues/26
[issue 27]: https://github.com/uniqush/uniqush-push/issues/27
[Feedback Service]: http://bit.ly/Zif0VM
