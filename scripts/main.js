const Discord = require('discord.js');
const client = new Discord.Client();

const BOT_TOKEN = 'NDY4NjQzMDU2OTg4NDU0OTQy.Di9DdQ.TtnXn524PVZX8bGx5p1gvGykyC4'

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

client.on('message', msg => {
  if (msg.content === 'こんにちは') {
    msg.reply('なんだって？');
  }
});

client.login('BOT_TOKEN');
