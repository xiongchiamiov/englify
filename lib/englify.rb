# encoding: utf-8

# May you recognize your weaknesses and share your strengths.
# May you share freely, never taking more than you give.
# May you find love and love everyone you find.

require 'rbrainz'

# Trying to match on an artist whose name is in crazy moonrunes causes REXML to
# complain about mismatched encodings.  So, we force UTF-8.
module MusicBrainz
	module Webservice
		class MBXML
			alias old_initialize initialize
			def initialize(stream, factory=nil)
				stream.set_encoding 'UTF-8'
				old_initialize(stream, factory)
			end
		end
	end
end

def englify(name)
		filter = MusicBrainz::Webservice::ArtistFilter.new(
			:name => name,
			:limit => 1
		)
		query = MusicBrainz::Webservice::Query.new
		artists = query.get_artists(filter)
		# Can't find 'em?  Just assume they're alright.
		if artists[0].nil?
			return name
		end
		artist = artists[0].entity
		
		# This *should* work, but it gives us nothing.
		#return artist.aliases[0]

		id = artist.id
		artist_includes = MusicBrainz::Webservice::ArtistIncludes.new(
			:aliases => true
		)
		artist = query.get_artist_by_id(id, artist_includes)
		englifiedName = artist.aliases[0].to_s
		if englifiedName == ''
			englifiedName = name
		end
		
		return englifiedName
end

