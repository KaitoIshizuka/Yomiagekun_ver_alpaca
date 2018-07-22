# Description:
#   discordでテキスト読み上げ
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md


module.exports = (robot) ->

  robot.respond /##yo/i, (msg) ->
    msg.send '受け取ったよ'
    if msg.message.user.voiceChannel
      msg.send 'はいるよ'
      msg.message.user.voiceChannel.join()
      msg.send 'はいったよ'
    else
      msg.send 'voiceChannel がないよ'

  robot.hear /^(?!##)|^(?!@)/i, (res) ->
    res.send res.message.text
    # res.send res.message.text

  robot.hear /^##.*$/i, (res) ->
    res.send 'メンションつけて、、'
