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

  robot.respond /##yo/i, (res) ->
    if res.message.user.name
      res.reply 'はいるよ'
      res.reply '#{msg.message.user.name}'
    else
      res.reply 'voiceChannel がないよ'

  robot.hear /^(?!##).*$/i, (res) ->
    res.send Object(res.message.text)
    # res.send res.message.text
