#WKModel.podspec
Pod::Spec.new do |s|
  s.name         = "WKModel"
  s.version      = "1.1"
  s.summary      = "一行代码实现字典转模型。"
  s.homepage     = "https://github.com/WelkinXie/WKModel"
  s.license      = 'MIT'
  s.author       = { "Welkin Xie" => "welkin995@126.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/WelkinXie/WKModel.git", :tag => s.version}
  s.source_files  = 'WKModel/WKModel/*.{h,m}'
  s.requires_arc = true
end