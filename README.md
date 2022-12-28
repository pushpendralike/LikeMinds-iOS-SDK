
<p align="center">
<img src="https://likeminds.community/wp-content/uploads/2021/04/LikeMinds-logo-green.png" alt="LikeMinds" title="LikeMinds" width="468"/>
</p>


## Why LikeMinds?

#### Faster go to market
Building a community platform in-house takes years of engineering efforts. LikeMindsChat enables community for your users in minutes.

#### Customisability
We understand every business has its unique requirements. Our framework is customisable to support community experiences the way you want to design them. As good as built in-house!

#### Scalable Infra
We have experts who have built for 25 Mil concurrent users. LikeMinds infrastructure is scalable no matter what the demand.

## How to use LikeMindsChat?

View [LikeMinds iOS Guide](https://docs.likeminds.community/category/ios)

# Initiate project 
Follow this tutorial to integrate group chat in your iOS app
## Getting Started
1. Add this entry in `Podfile`
```sh
pod 'LikeMindsChat', '~> 1.6.1'
```

2. Run the command.
```sh
pod install
```

## Initialize LikeMinds Chat
Remember to call this in your application life cycle method `applicationDidFinishLaunching` in `AppDelegate` class.

#### Step 1. Set up the extras and pass all the data required to initiate LikeMinds Chat

```swift
let LIKEMINDS_CHAT_API_KEY = "LIKEMINDS_CHAT_API_KEY"
let DOMAIN_URL = "YOUR_DOMAIN" 

let extras = InitiateLikeMindsExtra(apiKey: LIKEMINDS_CHAT_API_KEY)  //API Key generated
            .domainUrl(DOMAIN_URL) //Optional | Domain used for deeplinking
```

:::tip 
Domain should be in the format: "https://yourdomain.com"
:::

#### Step 2. Pass the extras created in `initiateLikeMinds()`

```swift
import LikeMindsChat
 
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    LikeMinds.shared.initiateLikeMinds(extras: extras)
    LikeMinds.shared.delegate = self
    return true
}
```
## Initialize Group Chat view
To initialize group chat in your view, pass the following paremeters
1. `userName` | Optional | Name/Alias of user
2. `userId` | Optinal | If you want to use your custom unique ID or when it's a returning user/login
3. `isGuest` | Optional | true - for guest user, false - for normal user
4. `groupChatResponse` | To get response which will contain `user:{}, community:{}`
	1. `user:{}` will be returned in a callback. Save `user_unique_id` present in `user:{}` in your **database** being returned in API to be used when user is login in the app after clearing data or logout i.e **returning user/login**
	2. `community:{}` will contain project meta data
5. `groupChatViewController` | Group chat view controller

```swift
import LikeMindsChat

LikeMinds.shared.initiateGroupChat(userName: userName, userId: userId, isGuest: isGuest)
    { groupChatResponse, groupChatViewController in
        // do something
    }
```
:::tip 
We suggest that you use the unique ID from your database for the user so that you do not have to save the one we generate. 
:::

## Firebase Integration
In order to receive notification, FCM server key needs to be generated. 
Setup Firebase Project and Turn on FCM services in their project.

1. [![](https://www.gstatic.com/devrel-devsite/prod/ve6ddf5bcead12ab16e41f3889a7fb0a07adddfafd7d99eb46840573a68200f4e/firebase/images/favicon.png)Add Firebase to your iOS project | Firebase Documentation](https://firebase.google.com/docs/ios/setup)
2. After that client have to provide us FCM Server Key.  
[![](https://cdn.sstatic.net/Sites/stackoverflow/Img/favicon.ico?v=ec617d715196)Firebase messaging, where to get Server Key?](https://stackoverflow.com/questions/37427709/firebase-messaging-where-to-get-server-key)  
  
**We will use this server key in our backend server to provide notifications**
