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
  robot.hear /.*/i, (res) ->
    res.send res.message.text

  robot.respond /.*こっち.*おいで.*/i, (msg) ->
    if msg.messageusr.voiceChannel
      msg.memberusr.voiceChannel.join()
    else
      message.reply 'voidChannel がないよ'
