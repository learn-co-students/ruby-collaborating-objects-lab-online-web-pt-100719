class Artist 

@@all = []

attr_accessor :name, :song
attr_reader :songs 

def initialize(artist_nme)
@name = artist_nme
@@all << self 
@songs = []
end 

def self.all
    @@all
end 


def add_song(song_obj)
    @songs << song_obj
end 

def self.find_or_create_by_name(art_name)
    self.find_by_name(art_name) || self.create_by_name(art_name)
end 

def self.find_by_name(str)
    @@all.detect{|obj| obj.name == str}
end 

def self.create_by_name(str)
    self.new(str)
end 

def print_songs
   songs.each {|song| 
   puts "#{song.name}"
}
end 

end 

