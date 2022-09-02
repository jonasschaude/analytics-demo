//
//  Copyright (c) 2018 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AppDelegate.h"
#import "SignInViewController.h"

@import FirebaseCore;
@import FirebaseAuth;
@import FirebaseAuthUI;


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // [START firebase_configure]
  // Use Firebase library to configure APIs
  [FIRApp configure];
  // [END firebase_configure]
  if ([FIRAuth auth].currentUser ==  nil) {
    _window.rootViewController =  [[SignInViewController alloc] init];
  }
  return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]];
}

@end
