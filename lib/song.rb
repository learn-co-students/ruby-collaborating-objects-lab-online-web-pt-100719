require 'pry'
class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.songs.push(self)
  end
  
  def self.all
    @@all
  end
  
  def name
    @name
  end
  
  def self.new_by_filename(filename)
    #binding.pry
    filename = filename.split(" - ")
    song = Song.new(filename[1])
    artist = Artist.new(filename[0])
    song.artist = artist
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
end