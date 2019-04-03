#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
require 'pry'

my_songs = {
"Go Go GO" => '/home/spirograph/jukebox-cli-london-web-career-042219/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/home/spirograph/jukebox-cli-london-web-career-042219/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/home/spirograph/jukebox-cli-london-web-career-042219/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/home/spirograph/jukebox-cli-london-web-career-042219/audio/Emerald-Park/04.mp3',
"Wolf" => '/home/spirograph/jukebox-cli-london-web-career-042219/jukebox-cli/Emerald-Park/05.mp3',
"Blue" => '/home/spirograph/jukebox-cli-london-web-career-042219/jukebox-cli/Emerald-Park/06.mp3',
"Graduation Failed" => '/home/spirograph/jukebox-cli-london-web-career-042219/audio/Emerald-Park/07.mp3'
}

def help
  puts <<-text
  I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program
text
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  my_songs.map do |song, path|
    puts song
  end
end

def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song title:"
  request = gets.chomp

  until my_songs.has_key?(request)
    puts "Please enter a valid, case-sensitive song title:"
    request = gets.chomp
  end

  my_songs.map do |song, path|
    if request == song
      puts "Now playing #{song}"
      binding.pry
      system "open #{path}"
    end
  end
end


def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
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
