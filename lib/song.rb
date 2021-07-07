# require 'pry'

# class Song
  
#   attr_accessor :name, :artist
   
#   @@all = []

#   def initialize(song_name)
#     @name = song_name
#     @@all << self 
#   end
  
#   def self.all
#     @@all
#   end 

#   def artist_name=(artist_name)
#         artist_obj = Artist.all.find{|artist| artist.name == artist_name}
#         if artist_obj == nil
#             artist_obj = Artist.new(artist_name)           
#         end
#         self.artist = artist_obj
#     end
  
#   def self.all
#     @all
#   end 
  
#   def self.new_by_filename(filename)
#         file_array = filename.split(" - ")
#         song = self.new(file_array[1])
#         artist_obj = Artist.all.select{|artist| artist.name == file_array[0]}
#         if artist_obj == [] 
#             artist_obj = Artist.new(file_array[0])
#         else
#             artist_obj = arti st_obj.pop
#         end 
#         song.artist = artist_obj
#         song
#     end 

# end

require 'pry'
class Song 
  attr_accessor :name, :artist
  @@all = []

  def initialize(title)
    @name = title 
    @@all.push(self)
  end 
  
  def self.all
    @@all 
  end 
  
  def self.new_by_filename(file_name)
    file_array = file_name.split(" - ")
    song = self.new(file_array[1])
    artist_obj = Artist.all.select {|artist| artist.name == file_array[0]}
    if artist_obj = [] 
      artist_obj = Artist.new(file_array[0])
    else
      artist_obj = artist_obj.pop
    end
      song.artist = artist_obj
      song
  end 
  
  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
  end
end 