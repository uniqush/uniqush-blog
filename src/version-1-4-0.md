Date: 2013-01-07
Title: New release of uniqush-push: 1.4.0
Tags: news, uniqush, release note
Slug: uniqush-push-1-4-0
Category: news

I am glad to announce the new release of uniqush-push: 1.4.0

Check out the [release note](http://uniqush.org/release-notes/rn-uniqush-push-1-4-0.html) for more details.

Changes in this version:

- *bugfix* Fixed the bug on re-connecting APNS server. Thanks to Ivan Yu for his [detailed bug report and analysis](https://groups.google.com/forum/?fromgroups=#!topic/uniqush/CLs7BEdDDoM)
- *feature* Added *loc-key*, *loc-args* and *action-loc-key* support for APNS. You can send your localized message through uniqush-pus now. This part of code is adapted from [benwei](https://github.com/benwei)'s patch. Thank you, [benwei](https://github.com/benwei). Here is an example of using *loc-key* and *loc-args*: `curl http://127.0.0.1:9898/push -d service=fake -d subscriber=client -d msg="hello" -d loc-key="lockey" -d loc-args="hello,world"` Then the `loc-args` sent to the APNS will be `["hello", "world"]`. Yes. it is comma separated. If one of your loc-key contains comma(,), then add a backslash (\\) in front of the comma. (Similar to escape character in C)
- *feature* Added support to true multicast for GCM.
- *feature* Added time-to-live support for both GCM and APNS. It defines how long (in seconds) the message should be kept on push service provider's server if the device is offline.
- *change* When subscribe to a GCM service, the user don't need to provide the *account* parameter. When unsubscribe a service, the user need to provide the same *regid* as the one he used to subscribe. For existing subscribers (i.e. the subscriber is added using previous releases), the *account* parameter is **required** when unsubscribe the service.
- *change* This change only affects developers. The interface of *PushServiceType* is changed making it possible to support true multicast on GCM. Corresponding components are changed.

