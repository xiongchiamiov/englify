# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'englify'
  s.version = '0.1.0'
  s.date = Time.now.strftime('%Y-%m-%d')

  s.authors = ["xiongchiamiov"]
  s.email = ['xiong.chiamiov@gmail.com']
  
  s.add_dependency 'rbrainz'
  
  s.files = %w( COPYING Rakefile README.md )
  s.files += Dir.glob "lib/*"
  
  s.extra_rdoc_files = ['README.md']
  
  s.summary = %q{Turn moonruned artist names into Romanized alternatives.}
  s.homepage = 'https://github.com/xiongchiamiov/englify/'
  s.description = %q{Turn moonruned artist names into Romanized alternatives.}
end
