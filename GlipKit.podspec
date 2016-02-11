Pod::Spec.new do |s|
  s.name             = 'GlipKit'
  s.version          = '0.0.2'
  s.summary          = 'A Glip client library for iOS and OS X written in Swift'
  s.homepage         = 'https://github.com/grokify/glip-sdk-swift'
  s.license          = 'MIT'
  s.author           = { 'John Wang' => 'johncwang@gmail.com' }
  s.source           = { :git => 'https://github.com/grokify/glip-sdk-swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/grokify'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true
  s.source_files = 'GlipKit/Sources/*.swift'  
  s.frameworks = 'Foundation'
end
