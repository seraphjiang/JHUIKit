#
# Be sure to run `pod lib lint JHUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JHUIKit"
  s.version          = "0.0.8"
  s.summary          = "A UIKit Library with lots of customized View."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A UIKit Library with lots of customized View.
- JHCircleImageView
- JHSwipeView
- JHProfileHeaderView
- JHProfileCardView
                       DESC

  s.homepage         = "https://github.com/seraphjiang/JHUIKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "jianghuan" => "seraphjiang@gmail.com" }
  s.source           = { :git => "https://github.com/seraphjiang/JHUIKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/seraphjiang'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JHUIKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JHUIKit' => ['JHUIKit/Assets/*., ']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
