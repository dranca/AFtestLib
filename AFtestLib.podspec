#
# Be sure to run `pod lib lint AFtestLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AFtestLib'
  s.version          = '1.2.0'
  s.summary          = 'Small lib to test the capablity to perform a request, save to file and connect to bluetooth.'
  
  s.description      = 'This Proof of Concept will include the functionality to connect and perfome a request to a server, save the result to the sandbox and connect through BLE'

  s.homepage         = 'https://github.com/dranca/AFtestLib.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexandru Dranca' => 'alexandru.dranca@fortech.ro' }
  s.source           = { :git => 'https://github.com/dranca/AFtestLib.git', :tag => s.version.to_s }
  s.swift_version = '4.2'
  s.ios.deployment_target = '11.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-L$(SRCROOT)/AFtestLib/AFtestLib/Classes/Ignore/Libraries -lCPP_LIB -lQt5Core -lqtpcre2 -lz',
                      'HEADER_SEARCH_PATHS' => '$(SRCROOT)/AFtestLib/AFtestLib/Classes/Ignore/Headers' }
  
  s.source_files = 'AFtestLib/Classes/**/*'
  
  s.frameworks = 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation', 'Foundation'
  s.private_header_files = 'AFtestLib/Classes/Ignore/Headers/**/*'
  
  # DO NOT remove this script. It prevents renaming of libCPP_LIB.a to libCPP_LIB breaking the project.
  s.script_phase = { :name => 'Prevent Rename', :script => 'puts "Prevent Rename"', :shell_path => '/usr/bin/ruby' }
end
