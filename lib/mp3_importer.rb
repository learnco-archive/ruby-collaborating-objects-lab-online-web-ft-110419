class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files(files)
    self.path << files
  end
end
