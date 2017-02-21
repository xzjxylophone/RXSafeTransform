

Pod::Spec.new do |s|
  s.name     = "RXSafeTransform"
  s.version  = "0.1"
  s.license  = "MIT"
  s.summary  = "RXSafeTransform is a safe data convert"
  s.homepage = "https://github.com/xzjxylophone/RXSafeTransform"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXSafeTransform.git', :tag => "v#{s.version}" }
  s.description = %{
      RXSafeTransform is a safe data convert.
  }
  s.source_files = 'RXSafeTransform/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '7.0'
end






