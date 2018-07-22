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
    if msg.message.user.name
      msg.reply 'はいるよ'
      msg.reply '#{msg.message.user.name}'
    else
      msg.reply 'voiceChannel がないよ'

  robot.hear /^(?!##).*$/i, (res) ->
    res.send Object(res.message.text)
    # res.send res.message.text
