require 'pry'
class Song
attr_accessor :name, :artist 

@@all = []

def initialize(name, artist = nil)
  @name = name 
  @artist = artist
  @@all << self
end

def name=(name)
  @name=name
end


def artist_name=(name)
    self.artist=(Artist.find_or_create_by_name(name))
    self.artist.add_song(self)
  end

def self.all
  @@all
end

def self.new_by_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    #binding.pry
    @@all << song
    song
  end





end 