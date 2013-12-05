Pod::Spec.new do |s|
  s.name         = "AXCopyingSwitch"
  s.version      = "0.2"
  s.summary      = "like a switch statement with NSCopying protocol"
  s.homepage     = "https://github.com/akiroom/AXCopyingSwitch"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroki Akiyama" => "aki-hiroki@nifty.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/akiroom/AXCopyingSwitch.git", :tag => "0.2" }
  s.source_files  = 'AXCopyingSwitch', 'Classes/**/*.{h,m}'
  s.requires_arc = false
end
