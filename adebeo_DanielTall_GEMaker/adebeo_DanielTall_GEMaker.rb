adebeoFileExtensionName = "adebeo_DanielTall_GEMaker"

require 'sketchup.rb'
require 'json'

module Adebeo
  module DanielTall_GEMaker

  end
end

adebeoRubyPath = File.dirname(__FILE__)

# REMOVE EXTENSION BEFORE SCRUMBLE
adebeoRubyExtensions = ".rb"
#$adebeoRubyExtensions = ""

#Set to false before Prod
isDevelloppement = false


# SELECTE SERVER
#$adebeoServerPath =  'http://localhost:3000'

extensionRubyfiles = Dir.glob("#{adebeoRubyPath}/**/*.rb")
extensionRubyfiles.each{|file|
	Sketchup::require file if File.basename(file, adebeoRubyExtensions) != adebeoFileExtensionName
	puts "load #{file}"
}

if not file_loaded?(adebeoFileExtensionName+"#{adebeoRubyExtensions}")
 if isDevelloppement
 	Sketchup.send_action "showRubyPanel:"
 end
 Adebeo::DanielTall_GEMaker::toolbar(isDevelloppement)
end

file_loaded("#{adebeoFileExtensionName}#{adebeoRubyExtensions}")