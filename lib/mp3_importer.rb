require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files=Dir.glob("#{@path}/*mp3")
    files.map do |filename|
      filename.sub!("#{@path}/", "")
    end
  end

  def import
    new_songs = files.map do |file|
      song = file.split(" - ").shift(2)
      song.join (" - ")
    end
    new_songs.each do |song|
      Song.new_by_filename(song)
    end
  end
end
