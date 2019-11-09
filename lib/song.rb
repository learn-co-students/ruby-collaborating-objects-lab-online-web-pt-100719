# class Song

#     attr_accessor :name
#     attr_writer :artist

#     @@all = []
  
#     def initialize(name)
#       @name = name
#       @@all << self
#     end
  
#     def self.new_by_filename(file_name)
#       song = file_name.split(" - ")[1]
#       artist = file_name.split(" - ")[0]
#       new_song = self.new(song)
#       new_song.artist_name = artist
#       new_song
#     end
  
#     def artist_name=(name)
#       self.artist = Artist.find_or_create_by_name(name)
#       artist.add_song(self)
#     end

#     def self.all
#         @@all
#     end


  
#   end

class Song
    # attr_writer :artist
    attr_accessor :name
    attr_reader :artist

    @@all = []
  
    def initialize(song_name)
        @name = song_name
        @@all << self
    end
  
    def artist=(artist_obj)
      # 1) set song obj artist attr
      @artist = artist_obj
      # binding.pry
  
      # 2) tell the artist about its song
      artist_obj.songs.push(self)
    end

    def self.all
        @@all
    end

    # def self.new_by_filename(file_name)
    #   info = new_by_filename.split(" - ")
    #   name_for_name = info[1]
    #   song_obj = self.new(name_for_name)
    #   artist_obj = Artist.new(info[0])
    #   song_obj.artist = artist_obj
    #   song_obj
    # end

    def self.new_by_filename(file_name)
        song = file_name.split(" - ")[1]
        artist = file_name.split(" - ")[0]
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end



    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end