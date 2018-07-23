# Description:
#   discordでテキスト読み上げ
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

Discord = require('discord.js')
bot = new Discord.Client()
BOT_TOKEN = 'NDY4NjQzMDU2OTg4NDU0OTQy.DjX3HQ.-VlfSFDMLtIwK49ryJAdrfQb6M8'

bot.login BOT_TOKEN

bot.on "ready", () ->
  console.log("ready")

bot.on 'message', (message) ->
  if message.author.id != bot.user.id
    message.channel.send message.content

    if message.content == '##joinus'
      if message.member.voiceChannel
        message.member.voiceChannel.join()
        .then connection ->
          message.reply '入ったよ'
          .catch console.log
        else
          message.reply 'voiceChannel に参加しなよ'


# module.exports = (robot) ->
#
#   ## ##comeonで始まると通話に入る
#   robot.respond /##comeon/i, (msg) ->
#     msg.send '受け取ったよ'
#     if robot.message.member.voiceChannel
#       msg.send 'はいるよ'
#       robot.message.member.voiceChannel.join()
#       msg.send 'はいったよ'
#     else
#       msg.send 'voiceChannel がないよ'
#
#   ## ## か @ で始まらない場合のみオウム返し
#   robot.hear /^(?!##|@)/i, (res) ->
#     res.send res.message.text
#     res.send robot.message.text
#
#   ## ## で始まる文について発言
#   robot.hear /^##.*$/i, (res) ->
#     res.send 'メンションつけて、、'
