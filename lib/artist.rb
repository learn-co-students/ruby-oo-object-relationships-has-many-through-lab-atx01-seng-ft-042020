class Artist 
    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs 
        Song.all.select {|song| song.artist.name == self.name}
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres 
        self.songs.map {|song| song.genre}
    end

    def self.all
        @@all
    end

end