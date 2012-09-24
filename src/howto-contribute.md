Date: 2012-09-23
Title: Making your own contribution to uniqush
Tags: uniqush, develop
Slug: howto-contribute
Category: dev

[Uniqush] now is receiving a growing attention from both users and developers.
Some people have already contacted me personally or publicly saying they are
willing to make there own contribution to [uniqush]. Some of them have already
made a pull request on github.

It is really an hornor to receive those talent works, merge them into our
repositories and make a better system through this process. To make it more
efficient and less error-prone, a new document on [how to make a contribution]
is online now. It is lighly receommended to *read
[this](http://uniqush.org/documentation/contribute.html) document first* before
making any contribution to [uniqush].

Some highlighted part of the document:

> For all source code repositories, there are three branches:
> 
> - master branch, contains the most recent changes, which are tested and will be
>   contained in the next release version. Normally, the code in master branch
> should be compiled correctly and pass some basic test cases.
> - exp branch, contains the most recent changes, which may contain bugs, or even
>   not be compiled. **Every contribution should be made based on exp branch**.
> - go1 branch (or release branch). If it is a repository contains
>   [go](http://golang.org) code, then this branch is named *go1*; otherwise, it
> is named *release*. As the name suggested, it contains the latest release
> version of the code. Please *DO NOT* make contribution based on this branch.
> 
> If you want to contribute your source code, please make sure your changes are
> based on *exp* branch, because we put our latest code there. It would be better
> to put your changed version in an individual branch or at least in *exp*
> branch, and then send your pull request on github. Before doing any work, you
> may want to read [this document](https://help.github.com/articles/fork-a-repo)
> from [github].

Please feel free to contribute your code, bug reports, ideas, suggests to this
project.  Whatever your contribution is, it is essential to us and all users in
this community. We appreciate your support!

[uniqush]: http://uniqush.org
[Uniqush]: http://uniqush.org
[how to make a contribution]: http://uniqush.org/documentation/contribute.html
[Apache 2.0]: http://www.apache.org/licenses/LICENSE-2.0.html
[Creative Commons Attribution 3.0 Unported License]: http://creativecommons.org/licenses/by/3.0/
[downloads]: http://uniqush.org/downloads.html
[uniqush.org]: http://uniqush.org
[uniqush blog]: http://blog.uniqush.org
[webgen]: http://webgen.rubyforge.org/
[pelican]: http://pelican.notmyidea.org/en/3.0/index.html
[www repository]: http://github.com/uniqush/uniqush-www
[blog repository]: http://github.com/uniqush/uniqush-blog
[git]: http://git-scm.com
[github]: http://github.com
[our github organization]: http://github.com/uniqush
[go programming language]: http://golang.org
[our mailing list]: http://groups.google.com/group/uniqush
