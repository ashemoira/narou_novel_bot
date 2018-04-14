require 'discordrb'
require './search'
require './help'
require './discord_token'

bot = Discordrb::Commands::CommandBot.new token: TOKEN, prefix: '/'

bot.command :narou do |event, *args|
  break if args.length.zero? || args.length > 2

  option = 0
  args.each do |arg|
    option += 1 if arg.include?('-')
  end

  case option
  when 0
    return event << '条件検索はできません' if args.length == 2
    search(args.first)
  when 1
    return event << help if args.first.include?('-help')
    return event << '検索したいタイトルが入力されていません' if args.length == 1
    option_search(args)
  when 2
    '検索オプションは2つ以上設定できません'
  end
end

bot.run
