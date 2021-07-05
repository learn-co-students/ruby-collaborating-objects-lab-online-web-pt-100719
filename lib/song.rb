class Song
  
  attr_accessor :name
  attr_reader :artist
  
  @@all = []
  
  def initialize(song_name)
    @name = song_name
    @@all << self
  end
  
  
  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.songs.push(self)
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(new_filename)
    info = new_filename.split(' - ')
    name_for_name = info[1]
    song_obj = self.new(name_for_name)
    artist_obj = Artist.new(info[0])
    song_obj.artist = artist_obj
    song_obj
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
  
  
  
end