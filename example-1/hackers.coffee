replies = [
  "Hack the planet!",
  "Mess with the best, die like the rest.",
  "You're in the butter zone now, baby."
]

module.exports = (robot) ->
  robot.response /hack/i, (msg) ->
    msg.send msg.random replies
