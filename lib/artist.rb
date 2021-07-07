class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(artist_name)
    @name = artist_name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end
  
  def self.find_or_create_by_name(art_name)
    self.find_by_name(art_name) || self.create_by_name(art_name)
  end
  
  def self.find_by_name(str)
    @@all.detect {|obj| obj.name == str}
  end
  
  def self.create_by_name(str)
    self.new(str)
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
end