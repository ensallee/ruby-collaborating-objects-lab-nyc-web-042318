require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :artist_name

  @@all=[]

  def initialize(name)
    @name = name
    @@all << name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.artist_name=(name)
    an_artist = Artist.find_or_create_by_name(name)
    @artist=(an_artist)
    @artist.add_song(@name)
  end

  def self.new_by_filename(file)
    name_string = file.split(" - ")[1]
    song = Song.new(name_string)
    artist_string = file.split(" - ")[0]
    new_artist = Artist.find_or_create_by_name(artist_string)
    song.artist= new_artist
    new_artist.songs << song
    song
  end
end
