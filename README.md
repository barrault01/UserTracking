# User Tracking
A simple application that is tracking user location

## Prerequisites

This is a swift 3 project running on Xcode. It was tested on Xcode 9.0 but it should also work on Xcode 8.

## Project organization

A target is represented by a unique folder that contain the Info.plist file and 2 folders:

 - Sources: that should only contains .swift, .storyboard and .xib files

 - Resources: that contain the resources of the target like image assets, app launch screen storyboard, core data models, json files...


## Prerequisites

### Using Bundle (optional but better)

I use bundle to help me with the installation of gems that I use for iOS developement (like Fastlane, Danger or even Cocoapods).

#### If you don't have bundle installed

```
gem install bundler
```

#### Install and Configure the project
```
git clone git@github.com:barrault01/UserTracking.git
cd UserTracking
bundle install
bundle exec pod install
open UserTracking.xcworkspace
```

### Whithout using bundle

As I use cocoapods for dependencies you need to have at least [cocoapods](https://cocoapods.org/) installed on your computer. If not: 

```
gem install cocoapods
```

#### Install and Configure the project
```
git clone git@github.com:barrault01/UserTracking.git
cd UserTracking
pod install
open UserTracking.xcworkspace
```


## SwiftLint

This project is using [SwiftLint](https://github.com/realm/SwiftLint), it's installed throught cocoapods so that you don't need to install it on your computer. 

