Date: 2013-02-25
Title: 1.4.1 and more
Tags: news, uniqush, release note
Slug: uniqush-push-1-4-1
Category: news

Today, I have release uniqush-push 1.4.1, whose [release note] is available now
along its binary files. It is highly recommended to update to this version,
since there will be some non-deterministic bugs in old versions. In this blog,
I will first go through the changes and explain some of them in details.

The changes in this version contains some improvements and bug fixes:

- *improvement* On (un)subscription, the log message now contains service and
  subscriber information. Fixed [issue 2]. 
- *improvement* On adding an APNS push service provider, uniqush-push will
  report error immediately if the given certificate or key files do not exist.
Fixed [issue 6].
- *bugfix* Removed all code related memory pool. There is no dependency on
  memory pool any more. Fixed [issue 7].
- *improvement* Rewrote the code in *main* package. It is more clean, simple
  and less redundant. Fixed [issue 5].

I will explain them one by one below.

### First two improvements

These two changes are not quite important but useful in its own right.

Apparently, adding more information into the log will help users and myself to
identify the potential bug, which is generally a good thing as long as we do
not leak sensitive information.

A system would be less error-prone if it reports error as soon as possible.
Before this version, users can add an APNS push service provider even by
providing a wrong path to the certificate and/or key files. The user can only
know this error if they are actually using the malformed APNS provider to push
something to a client. This is too late, and it should be better to report the
error in advance.

### No more memory pool

This is a hard decision to make.

I came up with the memory pool idea because of the [famouse blog
post](http://blog.golang.org/2011/06/profiling-go-programs.html). In the post,
Russ Cox was able to optimize a Go program 15x faster than the original
version, making it even faster than an equivalent C++ program. That post is
amazing and I really like it.

In the blog post, Russ Cox said:

> Having a garbage-collected language doesn't mean you can ignore memory
> allocation issues. In this case, a simple solution is to introduce a cache so
> that each call to FindLoops reuses the previous call's storage when possible.

Given the C/C++ background I had, the sentences above, to me, were like saying:
use a memory pool under whatever condition if you want to have a fast program.

Then I made a memory pool. That is the begining of the nightmare. I received
several bug reports on the mailing list saying that they observed some very
weird behavior. For example, some client received a message which should be
sent to another one. I tried to re-produce their bugs bug failed.

Finally, I reallized that the push service provider and delivery point
structures were not cleared before putting back to the memory pool. This
reminded me about the weird bugs on the mailing list.

I had two options: clear all data before putting them back to the pool; or drop
the whole idea of memory pool.

Well. I do like a fast program, but I love simplicity as well. Managing my own
memory using a garbage-collected language became a very awkward behavior to me.
It is true that Go's garbage collector is not perfect right now. Even if it is
good enough, it may need a good care of memory when writing programs anyway. But
it is not my current concern. I want a simple program which can work. In fact, I
even wrote a version with a correct behavior using memory pool. But I decided
to not release it because of potential bugs caused by complexity.

### Refactory

OK. this is a strong word for developers. Yes, I rewrote the whole *main* package.

I have to say that developing *uniqush* is really a learning process to me. I
developed quite a few programs, some of them are even widely used. However, I
haven't taken care of a project before uniqush. In uniqush, I have to write
correct code while making sure it can envolve in a healthy way. This includes
correcting my own mistakes and bad decisions in the code.

Refactorying the whole *main* package is correcting my bad design decision. I
made a wrong choice of using channels and goroutines in Go making the *main*
package cumbersome and hard to maintain. After this refactoring, the whole
*main* package contains only four files and reduced around a thousand of lines
of code. (You can see this fact from the [code frequency](https://github.com/uniqush/uniqush-push/graphs/code-frequency).)

Besides, since I am going to support [feedback service] in APNS, such
refactorying in inevitable. The service requires a new interface for push
service providers and old *main* package can hardly support the new interface.

### What about... uniqush-conn?

Sorry! I didn't expect that some essential parts is missing in Go and I have to
write them by my own. More specificly, I have already written a [Diffie-Hellman
Key Exchange library in Go](https://github.com/monnand/dhkx), and I am going to
implement RSASSA-PSS signature algorithm later.

With that being said, uniqush-conn will be delayed, again. 

[issue 2]: https://github.com/uniqush/uniqush-push/issues/2
[issue 6]: https://github.com/uniqush/uniqush-push/issues/6
[issue 7]: https://github.com/uniqush/uniqush-push/issues/7
[issue 5]: https://github.com/uniqush/uniqush-push/issues/5
[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-4-1.html
[feedback service]: http://developer.apple.com/library/mac/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ApplePushService/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW17
