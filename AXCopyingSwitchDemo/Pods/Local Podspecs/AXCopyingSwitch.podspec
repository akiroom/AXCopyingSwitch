
Pod::Spec.new do |s|
  s.name         = "AXCopyingSwitch"
  s.version      = "0.1"
  s.summary      = "like a switch statement with NSCopying protocol"
  s.description  = <<-DESC
                   like a switch statement with NSCopying protocol
                   DESC
  s.homepage     = "https://github.com/akiroom/AXCopyingSwitch"
  s.screenshots  = "raw.github.com/akiroom/AXCopyingSwitch/master/AXCopyingSwitchDemo/Screenshot.png"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroki Akiyama" => "aki-hiroki@nifty.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/akiroom/AXCopyingSwitch.git", :tag => "0.1" }
  s.source_files  = 'AXCopyingSwitch', 'Classes/**/*.{h,m}'
  s.requires_arc = true
end