class Artist
    #associations Artist has_many song
    attr_accessor :name
    attr_reader :songs
    @@all = []
  
    def initialize(artist_name)
      @name = artist_name
      @@all << self #self refers to newly created instance
      @songs = [] #contains collection of song objects
    end
  
    def self.all #class method 
      @@all 
    end
  
    def add_song(song_obj)
      #need to work with the song attr 
      @songs << song_obj
    end
  
    def self.find_or_create_by_name(art_name)
      @@all #within scope of method
      #return an artist instance
      self.find_by_name(art_name) || self.create_by_name(art_name)
    end
  
    def self.find_by_name(str)
    #need to access ALL aritst objects
    #iterate over array and find object that might name the string array
    @@all.detect {|obj| obj.name == str}
    end
  
    def self.create_by_name(str)
      self.new(str) #identical to saying Artist.new 
    end
  
    def print_songs
        self.songs.each do |song_obj| #could also just use @songs
            puts song_obj.name
        end
    end
  
  end