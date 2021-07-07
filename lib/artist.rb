class Artist 
  
  attr_accessor :name , :songs
  
  @@all = []
  
  def initialize(artist_name)
    @name = artist_name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def add_song(song_obj)
    @songs << song_obj
  end
  
  def self.create_by_name(str)
    self.new(str)
  end
  
  def self.find_by_name(str)
    self.all.find{|song| song.name == str}
  end
  
  def self.find_or_create_by_name(str)
      if self.find_by_name(str) == nil
        self.create_by_name(str)
      else 
        self.find_by_name(str)
      end 
  end
  
  def print_songs
   @songs.each do |song_obj|
     puts song_obj.name
    end
  end


  


end