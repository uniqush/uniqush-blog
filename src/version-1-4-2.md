Date: 2013-04-01
Title: Release 1.4.2
Tags: news, uniqush, release note
Slug: uniqush-push-1-4-2
Category: news

This version is mainly a bug-fix version. See the [release note] for more
details. I will briefly explain each point below. (This version is released on
April 1st. But it is **really not** a joke, I promis.)

### Proper stop

- *bugfix* Stop on */stop*. Sorry, I forgot to implement the feature after
  refactoring the main package. Fixed [issue 9].
- *bugfix* Stop on *SIGTERM*. Similar with [issue 9]. User can now stop the
  program by sending *SIGTERM* to the process. Fixed [issue 8]. 

The previours two bug fixes implemented what I promised in the document. Due to
the refactorying in version 1.4.1, this feature was not implemented,
accidentally.

### Nil-pointer crash

- *bugfix* Fixed a nil-pointer crash bug. The program will experience a
  nil-pointer crash (samething as NULL pointer) under some conditions. For
example, if user provides an invalid APIKEY for a GCM provider, then
uniqush-push will crash when the user tries to push through this malformed
provider. Fixed [issue 10].

Thank you, Fabrizio! Your [bug report] helps me a lot on this bug.

### Feeback Service in APNS

- *feature* Support [Feedback Service] in APNS. Fixed [issue 3].

I would say this is partly supported. The next version will support [Feedback
Service] much better. In the [Feedback Service]'s document, it says:

> You should use the timestamp to determine if the application on the device
> re-registered with your service since the moment the device token was
> recorded on the feedback service. If it hasn’t, you should cease sending push
> notifications to the device. 

However, *uniqush-push* does not keep the information like creation time of
each delivery point. To avoid unnecessary unsubscription, *uniqush-push* will
check the feedback after each push operation. This is not the optimal solution
and it will be fixed in next version.

[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-4-2.html
[Feedback Service]: http://bit.ly/Zif0VM
[issue 3]: https://github.com/uniqush/uniqush-push/issues/3
[issue 8]: https://github.com/uniqush/uniqush-push/issues/8
[issue 9]: https://github.com/uniqush/uniqush-push/issues/9
[issue 10]: https://github.com/uniqush/uniqush-push/issues/10
[bug report]: https://groups.google.com/forum/?fromgroups=#!topic/uniqush/dw5QyNkb3ro



