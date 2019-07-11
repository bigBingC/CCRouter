
Pod::Spec.new do |spec|

  spec.name         = "CCRouter"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of CCRouter."
  spec.description  = "iOS路由跳转工具，支持携带参数"
  spec.homepage     = "https://github.com/bigBingC"
  spec.license      = "MIT"
  spec.author       = { "cuibing" => "cuibing@dankegongyu.com" }
  spec.source       = { :git => "https://github.com/bigBingC/CCRouter.git", :tag => "#{spec.version}" }
  spec.source_files  = "CCRouter", "CCRouter/**/*.{h,m}"
  # spec.dependency "JSONKit", "~> 1.4"

end
