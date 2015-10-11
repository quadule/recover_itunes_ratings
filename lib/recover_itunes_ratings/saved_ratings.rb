require "itunes_parser/nokogiri_sax"

module RecoverItunesRatings
  # Enumerates the track ratings in an iTunes Library XML file.
  class SavedRatings
    IGNORED_TYPES = ["Music Video", "Movie", "Home Video", "TV Show", "Podcast",
    "iTunes U", "Audiobook", "Book", "Voice Memo"]

    def initialize(library_xml_path)
      @path = library_xml_path
    end

    def each
      parse on_track: ->(data) {
        next if data["Track Type"] == "Remote"
        next if IGNORED_TYPES.any?(&data.method(:has_key?))
        next if IGNORED_TYPES.any? { |t| data["Genre"] == t }

        yield data["Persistent ID"], data["Rating"].to_i
      }
    end

    private def library
      open(@path, "r")
    end

    private def parse(*args)
      ::ItunesParser::NokogiriSax.new(library, *args).parse
    end
  end
end
