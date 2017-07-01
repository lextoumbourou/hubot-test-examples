# Testing Hubot Script Examples

*Note: this is currently a WIP. Please don't trust any of the text below until I complete the project.*

A reference repository of unit tested Hubot scripts.

## Tools used

* [Jasmine](http://jasmine.github.io/) - for mocking and assertions. Feel free to replace with the library of your choice.
* [hubot-mock-adapter](https://github.com/blalor/hubot-mock-adapter) - to allow us to spy on certain Hubot events.

## Tools to consider

* [sinon](http://sinonjs.org/) - for mocks/stubs.
* [mocha](http://mochajs.org/) - for the test framework.
* [blanket.js](http://blanketjs.org/) - for code coverage.

## hubot-hackers

When somebody in the room mentions `hack`, this script will send a quote from the movie Hackers to the room.

```
> I just wanna hack it together.
> Mess with the best, die like the rest
```
### Testing Overview

There's not a lot to this script except that it utilises the `msg.random` method to get a random element from the `replies` array. Mocking `msg.random` isn't really possible (to do: verify this!), but by looking at `msg.random` implementation, I can see that it utilises `Math.random`, so by mocking that to return 0, we should be able to ensure that the results are consistent.
