#
# Be sure to run `pod lib lint STCTabView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "STCTabView"
  s.version          = "0.1.0"
  s.summary          = "View library to create browser-like tab bar."
  s.homepage         = "https://github.com/satococoa/STCTabView"
  s.license          = 'MIT'
  s.author           = { "Satoshi Ebisawa" => "e.satoshi@gmail.com" }
  s.source           = { :git => "https://github.com/satococoa/STCTabView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
end
