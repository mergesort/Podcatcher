Pod::Spec.new do |spec|
  spec.name         = 'Podcatcher'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage     = 'https://github.com/mergesort/Podcatcher'
  spec.author       =  { 'Joe Fabisevich' => 'github@fabisevi.ch' }
  spec.summary      = 'A library for interacting with iOS Podcast apps.'
  spec.source       =  { :git => 'https://github.com/mergesort/Podcatcher.git', :tag => "#{spec.version}" }
  spec.source_files = '*.{h,m}'
  spec.framework    = 'Foundation'
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/mergesort'
  spec.ios.deployment_target = '5.0'
end
