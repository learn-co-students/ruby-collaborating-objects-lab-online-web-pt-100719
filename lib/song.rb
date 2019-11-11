class Song 

attr_accessor :name, :artist
  attr_reader :artist_name

@@all = []

def initialize(song_name)
    @name = song_name
    @@all << self 
end 

def self.all
    @@all
end 

def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.songs.push(self)
end 

def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
end 

#def self.new_by_filename(file_name)
   # song = self.new(file_name.split("-")[1])
    #song.artist = Artist.new(file_name.split("-")[0])
   # song 
#end 



def self.new_by_filename(file_name)
    song = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
 end

end 