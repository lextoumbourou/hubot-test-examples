path = require 'path'
Robot = require 'hubot/src/robot'
TextMessage = require('hubot/src/message').TextMessage

describe 'Hackers hubot script', ->
  robot = null
  user = null
  adapter = null

  beforeEach ->
    ready = false
    runs ->
      robot = new Robot(null, 'mock-adapter', false, 'testbot')

      robot.adapter.on 'connected', ->
        (require '../hackers.coffee')(robot)

        user = robot.brain.userForId('1', user: 'someone', room: '#any')
        adapter = robot.adapter
        ready = true

      robot.run()

    waitsFor -> ready

  afterEach ->
    robot.shutdown()

  it 'lists for the word hack and responds with a phrase', (done) ->
    spyOn(Math, 'random').andReturn(0)

    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).toBe('Hack the planet!')
      done()

    adapter.receive new TextMessage user, 'something hack something'
