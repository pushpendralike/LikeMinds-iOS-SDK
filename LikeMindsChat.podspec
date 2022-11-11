#
#  Be sure to run `pod spec lint LikeMindsSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "LikeMindsChat"
  spec.version      = "1.3.0"
  spec.summary      = "LikeMindsChat"
  spec.description  = <<-DESC
                      LikeMinds Chat description.
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

  spec.source = { :git => "https://github.com/pushpendralike/LikeMinds-iOS-SDK.git", :tag => "#{spec.version}" }

  spec.vendored_frameworks = "LikeMindsChat.xcframework"
  spec.swift_version = "4.2"

  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  spec.dependency 'Alamofire'
  spec.dependency 'DCKeyValueObjectMapping', '1.5'
  spec.dependency 'MBProgressHUD', '1.1.0'
  spec.dependency 'SDWebImage', '~> 5.1'
  spec.dependency 'SDWebImageFLPlugin'
  spec.dependency 'iCarousel', '1.8.3'
  spec.dependency 'Toast', '4.0.0'
  spec.dependency 'Firebase/Messaging'
  spec.dependency 'Firebase/Database'
  spec.dependency 'Firebase/Storage'
  spec.dependency 'UITextView+Placeholder'
  spec.dependency 'IQKeyboardManagerSwift'
  spec.dependency 'AlamofireObjectMapper', '~> 5.2.0'
  spec.dependency 'SwiftyJSON', '~> 4.0'
  spec.dependency 'Kingfisher', '~> 7.0'
  spec.dependency 'ProgressHUD'
  spec.dependency 'MaterialShowcase'
  spec.dependency 'MKDropdownMenu'
  spec.dependency 'GooglePlaces'
  spec.dependency 'CircleProgressBar', '~> 0.32'
  spec.dependency 'CropViewController'
  spec.dependency 'AWSCore'
  spec.dependency 'AWSCognito'
  spec.dependency 'AWSS3'
  spec.dependency 'RealmSwift','10.5.2'
  spec.dependency 'Sentry', '~> 7.16'
  spec.dependency 'MoEngage-iOS-SDK', '7.0'
  spec.dependency 'MoEngageInApp','2.0.0'
  spec.dependency 'lottie-ios', '~> 3.2'
  spec.dependency 'SwiftyGif'
  spec.dependency 'Giphy'
  spec.dependency 'iOSDropDown'

end
