#song belongs to a method
#has artist attr
require 'pry'
class Song
  attr_reader :artist 
  attr_accessor :name

  @@all = []

  def initialize(song_name)
    @name = song_name #don't code until asked for this
    @@all << self
  end

  def artist=(artist_obj) #writer method / setting things = to objects not strings 
    # 1. Set song obj artist attr 
    @artist = artist_obj
    # 2. Tell the artist about the song (why we have to build the method and not attr_writer)
    artist_obj.songs.push(self)
  end

  def self.all 
    @@all
  end

  def self.new_by_filename(new_filename)
    #needs to return a song obj
    # name = new_filename.split(" - ")[1]
    # self.new(name) # || Song.new(name)
    info = new_filename.split(' - ')
    name_for_name = info[1]
    song_obj = self.new(name_for_name) 
    artist_obj = Artist.new(info[0])
    song_obj.artist = artist_obj
    song_obj
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end

end