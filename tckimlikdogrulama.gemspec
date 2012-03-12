# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tckimlikdogrulama/version" 

Gem::Specification.new do |s|
  s.name        = "tckimlikdogrulama"
  s.version     = Tckimlikdogrulama::VERSION
  s.authors     = ["Murat GUZEL"]
  s.email       = ["guzelmurat@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TC Kimlik No Dogrulama}
  s.description = %q{Ad, Soyad, TCKimlikNo ve DogumYili ile Dogrulama Yapar}

  s.rubyforge_project = "tckimlikdogrulama"  
  
  s.add_runtime_dependency "savon"
  s.add_runtime_dependency "unicode_utils"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
