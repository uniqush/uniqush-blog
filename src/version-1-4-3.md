Date: 2013-05-14
Title: Release 1.4.3 and uniqush-conn
Tags: news, uniqush, release note, plan
Slug: uniqush-push-1-4-3
Category: news

This version contains some minor bug fixes and includes some hidden features
which will be used by [uniqush-conn]. The [release note] explains all the
changes.

Instead of the changes themselves, in this post, I would like to talk about how
they related to the [uniqush-conn] and what's the next step.

### Hidden features? Why?

Well. This is a free and open source project. There is nothing hide from users.
However, hidden feature here means something for internal use and may be
changed or even deleted in the future. Users should not depend upon those
features.

To make those features isolated from daily use, we introduced a set of
parameters that users should avoid using them. When you send an HTTP request to
*uniqush-push*, you send several parameters. Any parameters whose name starting
from ``uniqush.`` should be considered as a *reserved parameter* and users
should not use those parameters. This is a very easy way of separating name
space and fortunately, *uniqush* is not a common word.

### uniqush-conn? Are you still working on it?

Yes. Definitely. Good news: it is almost done and in fact, you can [play with
it](https://github.com/uniqush/uniqush-conn/wiki/Play-with-examples) right now.
Moreover, you can even use our [java
library](http://github.com/uniqush/uniqush-client-java) and learn how to use it
with [the
example](https://github.com/uniqush/uniqush-client-java/tree/master/src/org/uniqush/examples/java).

So what am I waiting for? Why not release it and have all the fun?

As I promised, there should be libraries for mobile clients. Right now, I'm
still working on the [android
library](https://github.com/uniqush/uniqush-client-android) and there is still
zero line of code for iOS library. If I cannot support these two popular
platforms with the same functionality, I should not release the code.

But you can still read the code if you are really impatient.

### What's next?

In fact, my focus has switched to [uniqush-conn] and its related libraries in
recent months. You can tell this from [my github commit
history](http://github.com/monnand), where I am extending my longest streak by
working on these projects.

As I can expect, the [android
library](http://github.com/uniqush/uniqush-client-android) will be comming
soon. But the iOS library may experience some delay.

[release note]: http://uniqush.org/release-notes/rn-uniqush-push-1-4-3.html
[uniqush-conn]: http://github.com/uniqush/uniqush-conn


