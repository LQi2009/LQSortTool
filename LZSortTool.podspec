

Pod::Spec.new do |s|

  s.name         = "LZSortTool"
  s.version      = "0.0.1"
  s.summary      = "LZSortTool是一个对字符串或者NSObject的子类对象, 一般是model进行排序的工具"

  s.description  = <<-DESC
                      LZSortTool是一个对字符串或者NSObject的子类对象, 一般是model进行排序的工具, 使用简单, 集成方便, 排序结果准确
                   DESC

  s.homepage     = "https://github.com/LQQZYY/LZSortTool"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  

  s.license      = "MIT"

  s.author             = { "LQQZYY" => "302934443@qq.com" }
 
  s.social_media_url   = "http://www.jianshu.com/u/2846c3d3a974"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/LQQZYY/LZSortTool.git", :tag => "#{s.version}" }

  s.source_files  = "LZSortToolDemo/LZSortToolDemo/LZSortClass/*.{h,m}"

  s.requires_arc = true

end
