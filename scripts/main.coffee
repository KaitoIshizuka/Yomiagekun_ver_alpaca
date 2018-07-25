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

BOT_TOKEN = process.env.BOT_TOKEN
bot.login BOT_TOKEN

{ VoiceText } = require('voice-text')
{ writeFileSync } = require 'fs'

VOICE_TEXT_TOKEN = process.env.VOICE_TEXT_TOKEN
voiceText = new VoiceText(VOICE_TEXT_TOKEN)

textBuffer = []
userVoice = {}
VoiceTable = ['hikari', 'haruka', 'takeru', 'santa', 'bear', 'show']
con = null
speakingFlag = false
dispatcher = null

bot.on "ready", () ->
  console.log("ready")



bot.on 'message', (message) ->
  if message.author.id != bot.user.id
    # if /^(?!##).*$/i.exec "#{message.content}"
    #   message.channel.send message.content

    if /^(##).*$/i.exec "#{message.content}"
      if message.content == '##joinus'
        if message.member.voiceChannel
          message.member.voiceChannel.join()
          .then (connection) ->
            message.reply 'voiceChannelに入ったよ'
            con = message.member.voiceChannel.connection
            con.on 'speaking', (user,speaking) ->
              if user.id == bot.user.id & speaking
                if textBuffer.length
                  con.playStream(getYomiageStream(textBuffer.shift()))
                  speakingFlag = true
                  console.log "speaking"
              else
                speakingFlag = false
                console.log "黙ってる"
          .catch console.log
        else
          message.reply '先にvoiceChannel に参加してー'

      if message.content == '##bye'
        if con
          con.disconnect()
          message.channel.send 'バイバイ！また呼んでね！'
          con = null
        else
          message.reply '通話に参加してないです、、'

    if con
      if speakingFlag
        # voice = getVoiceByUser message.author.id
        voice = VoiceTable['takeru']
        textBuffer.push {
          voice: voice,
          msg: message.content
        }
      else
        # voice = getVoiceByUser message.author.id
        voice = VoiceTable['haruka']
        stream = getYomiageStream {
          voice: voice,
          msg: message.content
        }
        dispatcher = message.member.voiceChannel.connection.playStream(stream)

      # dispatcher.on 'speaking', () ->
      #   speakingFlag = true
      #   console.log "speaking"
      # dispatcher.on 'end', () ->
      #   speakingFlag = false
      #   console.log "speak finish"
      #
# if con
#   speakingFlag = false
#   console.log "speaking"
#   con.on 'speaking', (user, speaking) ->
#     if user.id == bot.user.id
#       speakingFlag = true
#       console.log "speaking"
#
getVoiceByUser = (id) ->
  if id in userVoice
    return userVoice[id]
  voice = VoiceTable[Math.floor Math.random() * VoiceTable.length]
  userVoice[id] = voice
  return voice

getYomiageStream = (obj) ->
    return voiceText.stream obj.msg, {
        speaker: obj.voice
    }

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
