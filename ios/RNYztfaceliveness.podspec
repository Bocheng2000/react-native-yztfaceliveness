
Pod::Spec.new do |s|
  s.name         = "RNYztfaceliveness"
  s.version      = "1.0.1"
  s.summary      = "RNYztfaceliveness"
  s.description  = <<-DESC
                  RNYztfaceliveness
                   DESC
  s.homepage     = "https://github.com/author/RNYztfaceliveness.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNYztfaceliveness.git", :tag => "master" }
  s.source_files  = "RNYztfaceliveness/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  