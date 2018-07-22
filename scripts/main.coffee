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

  ## ##comeonで始まると通話に入る
  robot.respond /##comeon/i, (msg) ->
    msg.send '受け取ったよ'
    if robot.message.member.voiceChannel
      msg.send 'はいるよ'
      robot.message.member.voiceChannel.join()
      msg.send 'はいったよ'
    else
      msg.send 'voiceChannel がないよ'

  ## ## か @ で始まらない場合のみオウム返し
  robot.hear /^(?!##|@)/i, (res) ->
    res.send res.message.text

  ## ## で始まる文について発言
  robot.hear /^##.*$/i, (res) ->
    res.send 'メンションつけて、、'
