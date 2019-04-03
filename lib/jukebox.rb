require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts <<-text
  I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program
text
end

def list(songs)
  songs.each.with_index(1) do |song, index|
    puts "#{index}. #{song}"
  end
end

def play(songs)
  request = gets.chomp
  song_num = song_by_name(songs,request)

  case song_num
  when 0
    puts "Invalid input, please try again."
  when 1..songs.length
    puts "Playing #{songs[song_num-1]}"
  end
end

def song_by_name(songs,request)
  song_num = request.to_i
  if song_num > 0 && song_num <= songs.length
    return song_num
  elsif song_num == 0
    songs.each.with_index(1) do |song, index|
      if request == song
        song_num = index
        return song_num
      end
    end
    return song_num
  else
    return 0
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"

  request = gets.chomp
  until request == "exit"
    case request
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "help"
      help
    end
    puts "Please enter a command:"
    request = gets.chomp
  end
  exit_jukebox
  exit
end
