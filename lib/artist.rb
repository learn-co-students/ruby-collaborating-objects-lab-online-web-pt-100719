class Artist
    @@all = []
    
    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song_obj)
        song_obj.artist = self
    end

    def self.find_or_create_by_name(name)
        selected_artist = self.all.select {|artist| artist.name == name}
        if selected_artist != [] 
            selected_artist.pop
        else
            self.new(name)
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

end
