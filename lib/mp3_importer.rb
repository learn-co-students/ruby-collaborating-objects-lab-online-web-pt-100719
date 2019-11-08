require 'pry'
class MP3Importer
  
  attr_accessor :path
  
  
  
  def initialize(path) 
    @path = path
  end
  
  def files
    Dir.children(path)
    #binding.pry
  end
  
  def import
    self.files.each {|file_name| Song.new_by_filename(file_name) }
  end
  
  
end