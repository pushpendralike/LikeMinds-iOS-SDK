#
#  Be sure to run `pod spec lint LikeMindsSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "LikeMindsSDK"
  spec.version      = "0.1.0"
  spec.summary      = "LikeMindsSDK"
  spec.description  = <<-DESC
                      LikeMinds SDK Description
                   DESC

  spec.homepage     = "https://github.com/pushpendralike/LikeMinds-iOS-SDK"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2022
                   Permission is granted to...
                  LICENSE
                }
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "pushpendrasingh" => "pushpendra.singh@likeminds.community" }

  # spec.platform     = :ios
  spec.platform     = :ios, "12.4"

  #  When using multiple platforms
  spec.ios.deployment_target = "12.4"

  spec.source       = { :git => "https://github.com/pushpendralike/LikeMinds-iOS-SDK.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "LikeMindsSDK.xcframework"
  spec.swift_version = "4.2"

   #  spec.dependency 'ColorSlider', '~> 4.4'
  spec.dependency 'AFNetworking', '4.0'
  spec.dependency 'CocoaLumberjack', '3.4.2'
  spec.dependency 'DCKeyValueObjectMapping', '1.5'
  spec.dependency 'MBProgressHUD', '1.1.0'
  spec.dependency 'SDWebImage/GIF', '4.4.2'
  spec.dependency 'iCarousel', '1.8.3'
  spec.dependency 'UIImageView-Letters'
  spec.dependency 'Toast', '4.0.0'
  spec.dependency 'Firebase'
  spec.dependency 'Firebase/Messaging'
  spec.dependency 'Firebase/Core'
  # spec.dependency 'Firebase/Analytics'
  spec.dependency 'Firebase/Database'
  spec.dependency 'Firebase/Storage'
  # spec.dependency 'Firebase/Crashlytics'
  spec.dependency 'UITextView+Placeholder'
  spec.dependency 'IQKeyboardManagerSwift'
  spec.dependency 'IQKeyboardManager'
  spec.dependency 'AlamofireObjectMapper', '5.2.0'
  spec.dependency 'SwiftyJSON'
  spec.dependency 'Kingfisher'
  spec.dependency 'ALCameraViewController'
  spec.dependency 'ProgressHUD'
  spec.dependency 'MaterialShowcase'
  spec.dependency 'MKDropdownMenu'
  # spec.dependency 'GooglePlaces'
  spec.dependency 'CircleProgressBar', '~> 0.32'
  spec.dependency 'Branch', '0.35.0'
  spec.dependency 'CropViewController'
  spec.dependency 'AWSCore'
  spec.dependency 'AWSCognito'
  spec.dependency 'AWSS3'
  spec.dependency 'RealmSwift','10.5.2'
  spec.dependency 'Analytics', '4.1.4'
  spec.dependency 'WootricSDK'
  spec.dependency 'RealmSwift', '10.5.2'
  spec.dependency 'Sentry'
  spec.dependency 'MoEngage-iOS-SDK', '7.0'
  spec.dependency 'MoEngageInApp','2.0.0'
  spec.dependency 'lottie-ios'
  spec.dependency 'SwiftyGif'
  spec.dependency 'Giphy'
  spec.dependency 'ATSwiftPhotoGallery'
  spec.dependency 'iOSDropDown'

end
