require 'pry'
class Artist 
  attr_accessor :name 
  @@all= []
  
  def initialize(name)
    @name = name
    @songs =[]
    @@all << self
  end
  
  
  
  def name=(name)
    @name = name 
  end
  
    
  def self.all
    @@all
  end
  
  def songs 
  @song_array = []
    Song.all.each do |song|
   if song.artist == self
    @song_array<< song
   end
 end
  @songs << @song_array
  @song_array
 end
  
  def add_song(song)
    song.artist=self
  end 
  
  def self.find(name)
    self.all.find do |artist| 
      artist.name == name
    end
  end
  
  def self.create(name)
    artist = Artist.new(name)
    
     artist
  end
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.new(name)
    end
  end
  
  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
  
  
  end