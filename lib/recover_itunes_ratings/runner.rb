require "recover_itunes_ratings/matched_tracks"
require "recover_itunes_ratings/saved_ratings"

module RecoverItunesRatings
  # Restores each rating found in the library XML to the current iTunes library.
  class Runner
    def initialize(library_xml_path, dry_run: true, reset_album_ratings: false)
      @dry_run = dry_run
      @reset_album_ratings = reset_album_ratings

      @ratings = SavedRatings.new(library_xml_path)
      @tracks = MatchedTracks.new(@ratings)
    end

    def run
      @tracks.each do |track, saved_rating|
        if @reset_album_ratings && track.album_rating_kind.get == :user
          name = "#{track.artist.get} - #{track.album.get}"
          puts "[#{track.album_rating.get/20} -> X] Album: #{name}"
          track.album_rating.set(-1) unless @dry_run
        end

        current_rating = track.rating.get
        next unless saved_rating && current_rating != saved_rating

        name = "#{track.artist.get} - #{track.name.get}"
        puts "[#{current_rating/20} -> #{saved_rating/20}]  Song: #{name}"
        track.rating.set(saved_rating) unless @dry_run
      end
    end
  end
end
