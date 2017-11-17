# iOS组件化实践（基于CocoaPods）

![](http://upload-images.jianshu.io/upload_images/1271438-f193b2dbc8b5251d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/700)

>做iOS开发的同学对这张图片再熟悉不过了，在使用第三库的时候，cocoapods确实给我们带来了极大的方便。那么，我们如何制作自己的pod呢？下面是之前的实践笔记

[参考资料 https://guides.cocoapods.org/](https://guides.cocoapods.org/)

[ShareUIDemo 链接](https://github.com/shiyeli/ShareUIDemo)

[简书原文链接](http://www.jianshu.com/p/c625733f0692)


![demo中组件式样](http://upload-images.jianshu.io/upload_images/1271438-c5a8c69289218419.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## cocoapods文档提供了两种方法：
* 方法1 `pod lib create YeshifuShareUI`
* 方法2  `pod spec create YeshifuShareUI`
两种方法之前都尝试过，方法一会帮助你创建一大堆的文件，包括演示demo创建；方法二方便你在现有的项目中提取你需要制作pod的代码。
这里使用方法2。

**在开始之前，我们先注册下CoocaPods ，`pod trunk register 422013052@qq.com  yetongxue`，之后你会收到一份邮件，需要点下里面链接验证。**

#### 详细步骤
###### 1 整理代码
随便找一个现有的项目，把里面的一个模块放在同一个文件夹下，我这里放在`ShareUI`文件夹下面。

![图一  项目目录结构](http://upload-images.jianshu.io/upload_images/1271438-3e701955e93a3ff9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### 2 创建 YeshifuShareUI.podspec文件
在终端cd 到ShareUIDemo (如图一所示)，执行`pod spec create YeshifuShareUI` ,得到文件YeshifuShareUI.podspec
##### 3 编辑 YeshifuShareUI.podspec
```
#
#  Be sure to run `pod spec lint YeshifuShareUI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "YeshifuShareUI"
  s.version      = "0.0.5"
  s.summary      = "CocoaPods组件化实践"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  CocoaPods组件化实践，一个简简单单的分享界面。
                   DESC

  s.homepage     = "https://github.com/shiyeli/ShareUIDemo"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  # 仓库创建的时候需要选择开源协议为MIT
  # 如果你忘记选择也不要紧，你在仓库根目录下面创建文件LICENSE,从其他地方复制过来就好，记得修改Copyright所有者信息
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "叶同学" => "yeli.studio@qq.com" }
  # Or just: s.author    = "叶同学"
  # s.authors            = { "叶同学" => "yeli.studio@qq.com" }
  s.social_media_url   = "http://yeli.studio"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  #s.platform     = :ios, "8.0"
  s.ios.deployment_target = '8.0'    #指定平台和最低支持版本
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/shiyeli/ShareUIDemo.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  #这里路径需要注意下，是以YeshifuShareUI.podspec为基准。
  #如果你的YeshifuShareUI.podspec文件在其他层级处创建的，那么根据自己的情况写。
  #ShareUI正是放置组件代码的文件夹
  s.source_files  = "ShareUIDemo/ShareUIDemo/ShareUI", "ShareUI/**/*.{h,m}"

  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

```
对于其他配置，根据需要，删删改改依葫芦画瓢就好。
##### 4 提交项目代码到github远程仓库
依次执行：
```
git add .  && git commit -m'配置podspec'
git tag 0.0.5 && git push --tags
```
##### 5 验证YeshifuShareUI.podspec 是否正确
`pod lib lint `

![](http://upload-images.jianshu.io/upload_images/1271438-b1ff2924625517f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 6 提交到CocoaPods
`pod trunk push YeshifuShareUI.podspec`

Success !

![](http://upload-images.jianshu.io/upload_images/1271438-5e8f5a8a363b24fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

完毕之后在CocoaPods搜索试试看

![](http://upload-images.jianshu.io/upload_images/1271438-7bfb672980c241aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 补充

Cocoapods 版本要求1.0.0 +

注册之后修改用户名：

`grep -A2 'trunk.cocoapods.org' ~/.netrc`

`curl -v -H "Acdef6f817a3e4" -H "Content-Type: application/json" -X POST -d '{"email":"422013052@qq.com","name”:"newname","description":"iMac"}' https://trunk.cocoapods.org/api/v1/sessions`

---
[我的博客 http://yeli.studio](http://yeli.studio/)

![业力实验室微信公众号](http://upload-images.jianshu.io/upload_images/1271438-988671689fcc61df.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
