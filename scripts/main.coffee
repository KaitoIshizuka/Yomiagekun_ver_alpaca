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
  robot.respond /こっちおいで/i, (msg) ->
    console.log Object(msg.messageusr)
    if msg.messageusr.voiceChannel
      msg.messageusr.voiceChannel.join()
      console.log mag.messageusr.voiceChannel
      message.reply 'はいるよ'
    else
      message.reply 'voidChannel がないよ'

  robot.hear /.*/i, (res) ->
    res.send res.message.text
