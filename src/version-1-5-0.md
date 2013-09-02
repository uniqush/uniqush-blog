Date: 2013-09-01
Title: Release 1.5.0: Kindle Support
Tags: news, release note
Slug: uniqush-push-1-5-0
Category: news

I'm very glad to announce that [uniqush] supports [ADM] since version 1.5.0,
which means users can use it to push notifications to Amazon Kindle Tablets.

This is the only change in this version and since it changed the user
interface, it is considered as a big change. (That's why we are no longer in
version 1.4.x). As always, here's the [release note].

I would like to share more details and plans in this post.

### Kindle was a pain

When I first released [uniqush], supporting Android and iOS is a very natural
choice. They are popular and share the major market. I considered to support
Windows phone soon, but because of lacking of device and environment (I use
GNU/Linux only and do not have a copy of Visual Studio), [this
issue](https://github.com/uniqush/uniqush-push/issues/4) is now marked as
"HelpWanted". It is wonderful if we support windows. But lack of windows
phone support won't hurt us much.

Kindle, on the other hand, is an exception. It is an android device but Amazon
chooses not to add [GCM] support. Moreover, it has a relatively large user
group making it hard to be ignored. Amazon introduced [ADM] in Dec 2012 making
yet another cloud service for developers to push notifications.

The release of [ADM] makes the idea behind [uniqush-push] more useful: Big
companies create clouds with little mind of compatibility with others.
For developers, a unified interface for push notification would be a very
useful component. Interestingly, Amazon seems have same idea in mind. Just
several weeks ago, Amazon released another service named
[SNS]. What they are doing is quite similar to what [uniqush-push] is
providing (and they charge users for it.) 

Supporting [ADM] fixed the very piece of [uniqush-push]: Now, we can say that
we supports major Android platforms with more confidence.

### Chrome apps support is on the way.

[Another issue](https://github.com/uniqush/uniqush-push/issues/30) on github
asks for support of Chrome apps. I think it would be a very good step for the
next release. (This means, we will quickly move to version 1.6.0 if we want to
keep the same versioning convention.) I don't need to buy another device to
support it (Buying a Kindle Fire HD cost me $159 even if it was on sale.) 

### Hey, do you remember uniqush-conn?

Yes, I do! And I would like to share some exciting news here: iOS client
library is almost done. If you follow the [uniqush organization], you may
notice that we have a new member: [nevo]. I know him personally for years and
he is a very competitive developer and a real expert in iOS development. Our
iOS client library is developed by [nevo] and is working right now.

So what I'm waiting for? Why not release all the stuff? Well. First, you can
always find the code on the [uniqush organization]. We never hind anything to
the public. Secondly, releasing a software means taking responsibility.
[uniqush-conn] would be an important component for our users' system. I have to
make sure it works and works well.

Before release it, I would like to first write some app and actually eat my own
dog food. An IM app will be developed to test the [uniqush] system as a whole
and I will invite my family and friends to use the app. Once it was fully
tested, I will release it along with detailed documentation.

[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-5-0.html
[uniqush]: http://uniqush.org
[uniqush-push]: http://github.com/uniqush/uniqush-push
[uniqush-conn]: http://github.com/uniqush/uniqush-conn
[uniqush organization]: http://github.com/uniqush
[ADM]: https://developer.amazon.com/sdk/adm.html
[GCM]: http://developer.android.com/guide/google/gcm/index.html
[APNS]: http://developer.apple.com/library/mac/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ApplePushService/ApplePushService.html
[C2DM]: http://code.google.com/android/c2dm/
[SNS]: http://aws.amazon.com/sns/
[nevo]: https://github.com/nevo

