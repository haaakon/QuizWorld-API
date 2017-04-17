Pod::Spec.new do |spec|
  spec.name         = 'QuizWorld-API'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/haaakon/QuizWorld-API'
  spec.authors      = { 'Tony Million' => 'bogen@beiningbogen.no' }
  spec.summary      = 'test summary'
  spec.source       = { :git => 'https://github.com/haaakon/QuizWorld-API.git', :branch => 'master' }
  spec.source_files = 'QuizWorldAPI/**/*.swift'
  spec.framework    = 'SystemConfiguration'
  spec.dependency     "Argo"
  spec.dependency     'ReactiveCocoa', '~> 5.0.3'
  spec.dependency     "ReactiveExtensions"
  spec.dependency     "Prelude"
  spec.dependency     "Curry"
end
