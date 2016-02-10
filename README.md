GlipKit SDK for iOS / OS X in Swift
===================================

[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![License][license-svg]][license-link]

`GlipKit` is a SDK to make integration with Glip (https://glip.com/) easier. It supports only incoming communications (from you to Glip).

## Installation

TBD

## Glip setup

This gem uses an incoming webhook integration on Glip. To create a new Glip webhook integration, in Glip.com, click on "Integrations" in the left column and then select the "Glip Webhooks" integration. After you select a conversation, a webhook URL will be presented which you will use with this gem to post messages to. The URL looks like the following:

```http
https://hooks.glip.com/webhook/11112222-3333-4444-5555-666677778888
```

## Usage

Initialize your poster and then call the `send_message` method to send your message. You must supply the webhook URL or webhook ID configured in the desired "Glip Webhooks" integration.

```swift
let glip = Poster(webhookURLOrID: "YOUR_WEBHOOK_URL_OR_ID")
glip.sendMessage("Hi there!")
```

You can send text in Markdown:

```swift
glip.sendMessage("* Location: [The Funky Buddha Lounge](http://www.thefunkybuddha.com)\n*Beer Advocate Rating: [99](http://tinyurl.com/psf4uzq)")
```

You can use an options array if you don't want to use the default settings.

```swift
glip.sendMessage("Hi there!", icon: "http://example.com/icon.png", activity: "Activity Alert", title: "A New Incoming Message Has Been Received")
```

You can preset your options:

```swift
glip = Poster(YOUR_WEBHOOK_URL, icon: "http://example.com/icon.png")
glip.sendMessage("Hi there!")
```

## Supported Swift / XCode Versions

This library supports the following Xcode / Swift implementations:

1. Xcode 7.2.1 / Swift 2.1.1

## Releases

Releases with release notes are availabe on [GitHub releases](https://github.com/grokify/glip-sdk-swift/releases). Release notes include a high level description of the release as well as lists of non-breaking and breaking changes.

### Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/grokify/glip-sdk-swift

Glip

* https://glip.com

## Contributing

1. Fork it ( http://github.com/grokify/glip-sdk-swift/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

 [build-status-svg]: https://api.travis-ci.org/grokify/glip-sdk-swift.svg?branch=master
 [build-status-link]: https://travis-ci.org/grokify/glip-sdk-swift
 [coverage-status-svg]: http://codecov.io/github/grokify/glip-sdk-swift/coverage.svg?branch=master
 [coverage-status-link]: http://codecov.io/github/grokify/glip-sdk-swift?branch=master
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/grokify/glip-sdk-swift/blob/master/LICENSE
