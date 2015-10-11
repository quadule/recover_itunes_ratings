require "rb-scpt"

module RecoverItunesRatings
  # Matches saved ratings with current iTunes tracks.
  class MatchedTracks
    def initialize(ratings, app = ::Appscript.app("iTunes"))
      @ratings = ratings
      @app = app
    end

    def each
      @ratings.each do |id, saved_rating|
        track = @app.tracks[::Appscript.its.persistent_ID.eq(id)].get.first
        yield track, saved_rating if track
      end
    end
  end
end
