
Pod::Spec.new do |s|

 

  s.name         = "SwiftPopMenu"
  s.version      = "2.0.0"
  s.summary      = "support swift5 ,easy use SwiftPopMenu on iOS"
  s.swift_version = '5.0'
 
  s.description  = "优化使用方式 support swift5 ,easy use SwiftPopMenu on iOS"

  s.homepage     = "https://github.com/TangledHusky/SwiftPopMenu"
  

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "TangledHusky" => "994825763@qq.com" }
  s.platform     = :ios, "8.0"



  s.source       = { :git => "https://github.com/TangledHusky/SwiftPopMenu.git", :tag => "v#{s.version}" }



  s.source_files  = "SwiftPopMenu/*.{swift}"




end
