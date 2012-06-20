# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "dynect-utils"
  s.version     = "0.0.2"
  s.authors     = ["Pete Fritchman"]
  s.email       = ["petef@databits.net"]
  s.homepage    = "https://github.com/fetep/dynect-utils"
  s.summary     = %q{Utilities to interact with the DynECT API}
  s.description = %q{Utilities included: nagios plugin to check GSLB status,
tool to manipulate the serving mode of GSLB addresses
}

  s.rubyforge_project = "dynect-utils"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "dynect_rest"
  s.add_runtime_dependency "trollop"
end
