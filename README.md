
<p align="center">
<img src="https://likeminds.community/wp-content/uploads/2021/04/LikeMinds-logo-green.png" alt="LikeMinds" title="LikeMinds" width="468"/>
</p>

## Why LikeMinds?

#### Faster go to market
Building a community platform in-house takes years of engineering efforts. LikeMinds SDK enables community for your users in minutes.

#### Customisability
We understand every business has its unique requirements. Our SDK is customisable to support community experiences the way you want to design them. As good as built in-house!

#### Scalable Infra
We have experts who have built for 25 Mil concurrent users. LikeMinds infrastructure is scalable no matter what the demand.

## How to use LikeMinds-iOS-SDK?

### Install using pod

Add below line into your podfile.

```sh
pod 'LikeMindsSDK', '~> 0.1.1'
```
And run the command on your project root.

```sh
pod install
```

### Initialization

Remember to call this in your application life cycle method <code>applicationDidFinishLaunching</code> in <code>AppDelegate</code> class.


```sh
import LikeMindsSDK

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LikeMindsSDK.shared.initiateLikeMinds(apiKey: LIKEMINDS_API_KEY)
        LikeMindsSDK.shared.delegate = self
        return true
}
```
#### Implemention of Likeminds delegate methods to take require action

```sh
extension AppDelegate: LikeMindsSDKDelegate {

    func loginRequiredCallback() {
        // do something
    }
    
    func eventFiredCallback(eventName: String, properties: [String : Any]) {
        // do something to track event
    }
}
```
#### To add route feature on tap of notification, pass the userInfo data to likeminds sdk.

Call this method in AppDelegate in <code>didReceiveRemoteNotification</code>

```sh
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    LikeMindsSDK.shared.didReceieveNotification(userInfo: userInfo)
}
```

Or by implementing <code>UNUserNotificationCenterDelegate</code> in AppDelegate

```sh
extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        LikeMindsSDK.shared.didReceieveNotification(userInfo: response.notification.request.content.userInfo)
    }
}
```

#### Initialization of group chat list view.

Group chat list view can be present or push from your <code> UIViewController </code> class.

```sh
import LikeMindsSDK

LikeMindsSDK.shared.initiateGroupChat(userName: USERNAME, userId: USERID, isGuest: true|false) { [weak self] response, chatListViewController in
            guard let chatListViewController = chatListViewController else { return }
                  let navigationController = UINavigationController(rootViewController: chatListViewController)
            self?.navigationController?.present(navigationController, animated: true)
 }
```


