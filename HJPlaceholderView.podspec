Pod::Spec.new do |s|
  s.name         = "HJPlaceholderView"
  s.version      = "1.0.0"
  s.summary      = "空白占位视图"
  s.homepage     = "https://github.com/HaijunWei/HJPlaceholderView.git"
  s.license      = "MIT"
  s.author       = { "Haijun" => "whj929159021@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/HaijunWei/HJPlaceholderView.git", :tag => s.version.to_s }
  s.requires_arc = true
  
  s.source_files  = "Classes/**/*.{h,m}"
  s.resources = "Classes/*.bundle"
end
