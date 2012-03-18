# encoding: utf-8

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
		artist = artists[0].entity
		
		# This *should* work, but it gives us nothing.
		#return artist.aliases[0]

		id = artist.id
		artist_includes = MusicBrainz::Webservice::ArtistIncludes.new(
			:aliases => true
		)
		artist = query.get_artist_by_id(id, artist_includes)
		return artist.aliases[0]
end

name = '菅野よう子'
puts englify(name)

