# class Artist
#   # associations Arist has_many songs
#   attr_accessor :name
  

#   @@all = []

#   def initialize(artist_name)
#     @name = artist_name
#     @@all << self # self refers to the newly created instance
#     # @songs = [] # should/will contain a collection of song OBJS 
#   end

#   def self.all
#     @@all
#   end
  
#   def songs
#     Song.all.select{|song| song.artist == self}
#   end

#   def add_song(song)
#     @@all << song unless @@all.include?(song)
#     song.artist = self if song.artist == nil
#   end

#   def self.find_or_create_by_name(name)
#     selected_artist = self.all.find {|artist| artist.name == name}
#     if selected_artist != [] 
#       selected_artist.pop
#     else
#       self.new(name)
#     end
#   end
  
#   def print_songs
#     self.song.each {|song| puts song.name}
#   end
# end

class Artist
  attr_accessor :name, :song 
  @@all = []

  def initialize(name)
    @name = name 
    @@all.push(self)
  end 
  
  def self.all
    @@all
  end 
  
  def songs
    Song.all.select {|song| song.artist == self}
  end 
  
  def add_song(song)
    song.artist = self 
  end 
  
  def self.find_or_create_by_name(name)
    searched_artist = self.all.select {|artist| artist.name == name}
    if searched_artist != []
      searched_artist.pop
    else 
      self.new(name)
    end
  end 
  
  def print_songs
    Song.all.each {|song| if song.artist == self then puts song.name end}
  end 
end 