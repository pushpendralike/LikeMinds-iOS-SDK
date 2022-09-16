
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

### Install using pod

Add below line into your podfile.

```sh
pod 'LikeMindsChat', '~> 1.1'
```
And run the command on your project root.

```sh
pod install
```

### Initialization

Remember to call this in your application life cycle method <code>applicationDidFinishLaunching</code> in <code>AppDelegate</code> class.


```sh
import LikeMindsChat

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let extras = InitiateLikeMindsExtra(apiKey: API_KEY)
                .withDomainUrl(DOMAIN_URL)
    LikeMinds.shared.initiateLikeMinds(extras: extras)
    LikeMinds.shared.delegate = self
        return true
}
```
#### Implemention of Likeminds delegate methods to take require action

```sh
extension AppDelegate: LikeMindsDelegate {

    // When guest user tries to send a message, reaction, view participants, view profile and join chatroom.
    func loginRequiredCallback() {
        // add login view code
    }
    
    // Track user based event 
    func eventFiredCallback(eventName: String, properties: [String : Any]) {
        // call your user based event track api
    }
}
```
#### To add route feature on tap of notification, pass the userInfo data to likeminds.

Call this method in AppDelegate in <code>didReceiveRemoteNotification</code>

```sh
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    LikeMinds.shared.didReceieveNotification(userInfo: userInfo)
}
```

Or by implementing <code>UNUserNotificationCenterDelegate</code> in AppDelegate

```sh
extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        LikeMinds.shared.didReceieveNotification(userInfo: response.notification.request.content.userInfo)
    }
}
```

#### Initialization of group chat list view.

Group chat list view can be present or push from your <code> UIViewController </code> class.

```sh
import LikeMindsChat

LikeMinds.shared.initiateGroupChat(userName: USERNAME, userId: USERID, isGuest: true|false) { [weak self] response, chatListViewController in
    guard let chatListViewController = chatListViewController else { return }
          let navigationController = UINavigationController(rootViewController: chatListViewController)
    self?.navigationController?.present(navigationController, animated: true)
 }
```

## React Native bridge for iOS

For React Native applications to use the LikeMindsChat, we have to follow the following steps.

Note: All the following code changes will be done in the iOS folder of the react native project.


### Step 1: Import LikeMinds Dependency

#### Install LikeMindsChat using pod

Open podfile and add below line into your podfile.

```sh
pod 'LikeMindsChat', '~> 1.1'
```
Run the command on your project ios root folder.

```sh
pod install
```

#### Bridging React Native with iOS Dynamic frameworks

This is a certain issue that one may face while bridging the native iOS code using a dynamic framework. As we know for iOS we use Cocoapods to compile our dependencies(pods) and by default these Cocoapods install our dependencies as static libraries. So React Native’s iOS dependencies are already compiled as static libraries(with any bundle resource being copied to the main app) because of which compilation issues may arise when we try to use a dynamic framework.

::: Tips
To use a dynamic framework like this one we have to use use_frameworks! which is Cocoapods directive in our Podfile.However using the use_frameworks! callback will cause all pods to be compiled as dynamic frameworks even if they are static libraries and it will also cause some react native pods to fail and a large number of third-party packages might fail as well
:::

To use dynamic frameworks with static libraries stumbled upon a CocoaPods plugin called <code> cocoapods-user-defined-build-types </code>. So the first step is to install plugin on your device. Open your terminal and run the following command

```sh
gem install cocoapods-user-defined-build-types
```
After this go to your project’s Podfile and on top of the file add the following code:

```sh
plugin ‘cocoapods-user-defined-build-types' 
enable_user_defined_build_types!      
```
The above code will enable the custom user-defined build types in our iOS project and then we can define the custom build type for a specific pod as shown below:

```sh
pod 'LikeMindsChat', '~> 1.1', :build_type => :dynamic_framework
```

After all this setup run the pod command

```sh
pod install
```

### Step 2: Initialise LikeMindsChat 

 Initialise LikeMindsChat in the application life cycle method <code>applicationDidFinishLaunching</code> in <code>AppDelegate</code> class.
 As we developed this framework in swift, so we need a helper swift class to provide a method for initialisation of likeminds framework and helper class method will call into <code> AppDelegate.m </code> lifecycle method <code> didFinishLaunchingWithOptions </code>.
 
 ```sh
import LikeMindsChat

@objc class LikeMindsSetup: NSObject {
  @objc func initializeLikeMinds(application: UIApplication, callback: AppDelegate) {
    let extras = InitiateLikeMindsExtra(apiKey: LIKEMINDS_API_KEY)
      .withDomainUrl(DOMAIN_URL)
    LikeMinds.shared.initiateLikeMinds(extras: extras)
    LikeMinds.shared.delegate = callback
  }
}
 
 ```

Call the Helper class method into <code> AppDelegate </code> lifecycle method <code> didFinishLaunchingWithOptions </code>. 

```sh
// Bridging header to access swift classes into objective-c
import "ProjectName-Swift.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ...
  LikeMindsSetup *likemindsSetup = [LikeMindsSetup new];
  [likemindsSetup initializeLikeMindsWithApplication:application callback: self];
  return true
}
```

#### Implemention of Likeminds delegate methods to take require action

```sh
extension AppDelegate: LikeMindsDelegate {

    // When guest user tries to send a message, reaction, view participants, view profile and join chatroom.
    func loginRequiredCallback() {
        // add login view code
        LikeMindsEmitterManager.shared.sendEvent(withName: "LOGIN_REQUIRED", body: nil)
    }

    // Track user based event 
    func eventFiredCallback(eventName: String, properties: [String : Any]) {
        // call your user based event track api
        LikeMindsEmitterManager.shared.sendEvent(withName: "EVENT_FIRED", body: props)
    }
}
```

### Step 3: Create a ViewManager class to show group chat screen

#### Create <code>LikeMindsView.swift</code> subview of <code>UIView</code>.

```sh


@objc(LikeMindsAppView)
class LikeMindsAppView: UIView {
  var homeFeedViewController: UIViewController?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @objc func addLikeMindsView(to view: UIView, userName: NSString, userId: NSString, isGuest: Bool ) {
    LikeMinds.shared.initiateGroupChat(userName: userName as String, userId: userId as String, isGuest: isGuest)
    { [weak self] response, vc in
      DispatchQueue.main.async {
        guard let _ = self?.homeFeedViewController else  {
          self?.homeFeedViewController = vc
          guard let viewVC = vc?.view else { return }
          self?.addSubview(viewVC)
          return
        }
        self?.homeFeedViewController?.viewWillAppear(true)
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

```

#### Create a <code>GroupChatViewManager.m</code> class with subcalss of <code> RCTViewManager </code> which use to expose class, methods and properties to react native app.

```sh
#import <Foundation/Foundation.h>

#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "YourProjectName-Swift.h"

@interface GroupChatViewManager : RCTViewManager
@end

@implementation GroupChatViewManager

RCT_EXPORT_MODULE(GroupChatView)

RCT_EXPORT_METHOD(callLikeMindsModule:(nonnull NSNumber*) reactTag userName:(nullable NSString*) userName userId: (nullable NSString*)                                  userId isGuest:(BOOL) isGuest) {
  NSLog(@"callLikeMindsModule method");
  [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
    LikeMindsView *appView = viewRegistry[reactTag];
    if (!appView || ![appView isKindOfClass:[LikeMindsView class]]) {
      RCTLogError(@"Cannot find NativeView with tag #%@", reactTag);
      return;
    }
    [appView addLikeMindsViewTo: appView userName:userName userId:userId isGuest:isGuest];
  }];
}

- (UIView *)view
{
  LikeMindsView *appView = [LikeMindsView new];
  [appView addActivityIndicator];
  return appView;
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

@end

```

Method <code> addLikeMindsView </code> in class <code> LikeMindsAppView </code> calls a function <code> LikeMinds.shared.initiateGroupChat </code> which shows the group chat screen.


#### Create <code>LikeMindsEmitterManager.swift</code> subview of <code>RCTEventEmitter</code>.

Emitter manager sends the event to react native app to perform action on that event.

```sh
@objc(LikeMindsEmitter)
class LikeMindsEmitterManager: RCTEventEmitter {

  public static var shared: RCTEventEmitter!

  override init() {
    super.init()
    LikeMindsEmitterManager.shared = self
  }

  override func supportedEvents() -> [String]! {
    return ["LOGIN_REQUIRED", "EVENT_FIRED"]
  }

  @objc
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

```


#### Create a <code> LikeMindsChatEmitterManager.m </code> class with subclass of <code> RCTEventEmitter </code> to expose emitter class, methods and properties to react native app.

```sh
#import <React/RCTViewManager.h>
#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(LikeMindsChatEmitter, RCTEventEmitter)
  RCT_EXTERN_METHOD(supportedEvents)
@end
  
```

### Step 4: Create a component for the Group chat screen.

Note: From here on, all the changes will be done in javascript files. 
Create a component <code> GroupChatView.js </code> to show the Group Chat Screen in the react native app.

```sh
import {requireNativeComponent} from 'react-native';

export const GroupChatView = requireNativeComponent(
 'GroupChatView',
);

```

### Step 5: Update component

Create a <code> LikeMindsView.js </code> to update the view.

```sh

import {useNavigation} from '@react-navigation/native';
import React, {useCallback, useEffect, useRef} from 'react';
import {
    UIManager,
    findNodeHandle,
    PixelRatio,
    Dimensions,
    NativeEventEmitter,
} from 'react-native';
import {GroupChatView} from '../screens/ModuleName/GroupChatView';

const windowWidth = Dimensions.get('window').width;
const windowHeight = Dimensions.get('window').height;

const LikeMindsTab = () => {
 let user_name: string | null;
 let user_id: string | null;
 let is_guest: boolean | null;

 const {LikeMindsEmitter} = NativeModules;
 const likeMindsEmitter = new NativeEventEmitter(LikeMindsEmitter);

 const ref = useRef(null);
 const navigation = useNavigation();

//check if user is logged in
 if (isLoggedIn) {
   console.log('user is logged in');
   user_name = firstName + ' ' + lastName;
   user_id = id;
   is_guest = false;
 } else {
   console.log('user is guest user');
   user_name = null;
   user_id = null;
   is_guest = true;
 }

 const createUIView = useCallback(
    (
      viewId: number | null,
      userName: string | null,
      userId: string | null,
      isGuest: boolean | null,
    ) => {
      console.log('create UIView called');
      return UIManager.dispatchViewManagerCommand(
        viewId,
        UIManager.getViewManagerConfig('GroupChatView').Commands.callLikeMindsModule,
        [userName, userId, isGuest],
      );
    },
    [],
  );

 const loginRequiredCallback = useCallback(() => {
   console.log('login required');
   //navigate to auth screen
 }, []);

 const eventCallback = useCallback((props: any) => {
   console.log(props);
 }, []);

 useEffect(() => {
     const event1 = likeMindsEmitter.addListener(
        'LOGIN_REQUIRED',
        loginRequiredCallback,
      );
      const event2 = likeMindsEmitter.addListener(
        'EVENT_FIRED',
        eventCallback,
      );
      return () => {
        console.log('events are removed');
        event1.remove();
        event2.remove();
      };
 }, [eventCallback, loginRequiredCallback]);

 useEffect(() => {
   const viewId = findNodeHandle(ref.current);
   if (viewId !== null) {
     createUIView(viewId, user_name, user_id, is_guest)
   } else {
     console.log('view id is null');
   }
 }, [createUIView, is_guest, user_id, user_name]);

 return (
   <GroupChatView
     style={{
       // converts dpi to px, provide desired height
       height: PixelRatio.getPixelSizeForLayoutSize(windowHeight),
       // converts dpi to px, provide desired width
       width: PixelRatio.getPixelSizeForLayoutSize(windowWidth),
     }}
     ref={ref}
   />
 );
};

export default LikeMindsView;

```

