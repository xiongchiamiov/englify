# encoding: utf-8

require 'test/unit'
require 'englify'

class EnglifyTest < Test::Unit::TestCase
	def test_kanji
		assert_equal 'Yoko Kanno', englify('菅野よう子')
	end
	
	def test_already_romanized
		assert_equal 'Yoko Kanno', englify('Yoko Kanno')
	end
	
	def test_no_artist
		assert_equal 'aosidnfwefsdf', englify('aosidnfwefsdf')
	end
	
	def test_no_aliases
		assert_equal 'Liv Tyler', englify('Liv Tyler')
	end
end

