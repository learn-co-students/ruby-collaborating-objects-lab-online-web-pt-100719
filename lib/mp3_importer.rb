# class MP3Importer 
#   attr_reader :path

#   def initialize(music_path)
#     @path = music_path
#   end 
  
#   def files
#     Dir.children(@path)
#   end 
  
#   def import 
#     self.files.each {|file_name| Song.new_by_filename(file_name)}
#   end 

# end 

class MP3Importer
  attr_accessor :path 

  def initialize(path)
    @path = path 
  end 
  
  def files
    Dir.children(@path)
  end   
  
  def import
    self.files.each {|file_name| Song.new_by_filename(file_name)}
  end 

end