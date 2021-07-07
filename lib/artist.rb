class Artist 
  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
    # Receives instance of a Song, associates it with instance of an Artist
  end
  
  def songs 
    Song.all.select { |song| song.artist == self }
    # returns array of songs that belong to self, get all existing song instances and select only ones associated with self
  end
  
  def self.find_or_create_by_name(name)
    looking_for = self.all.detect { |artist| artist.name == name }
    if looking_for == nil 
      self.new(name)
    else
      looking_for
    end
  end
  
  def print_songs
    self.songs.each { |song| puts song.name }
  end
    
end