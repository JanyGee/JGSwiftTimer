<p align="center" >
  <img src="https://github.com/JanyGee/JGSwiftTimer/blob/main/Source/icon.png">
</p>

# JGSwiftTimer
[![Version](https://img.shields.io/cocoapods/v/JGSwiftTimer.svg?style=flat)](http://cocoapods.org/pods/JGSwiftTimer)
[![License](https://img.shields.io/cocoapods/l/JGSwiftTimer.svg?style=flat)](http://cocoapods.org/pods/JGSwiftTimer)
[![Platform](https://img.shields.io/cocoapods/p/JGSwiftTimer.svg?style=flat)](http://cocoapods.org/pods/JGSwiftTimer)
[![Swift-5.0](http://img.shields.io/badge/Swift-5.0-blue.svg)]()

JGSwiftTimer is a lightweight timer extension for Swift.     [OC](http://cocoapods.org)

## Installation

JGSwiftTimer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JGSwiftTimer"
```

## Usage

```swift
import JGTimer.h
```

## Methods
**executeTask(start: TimeInterval, interval: TimeInterval, repeats: Bool, async: Bool, task: @escaping ()->Void) -> String?**
```Swift
JGTimer.executeTask(start: 3, interval: 1, repeats: true, async: true, task: {self.doTask()})
```

**executeTask(start: TimeInterval, interval: TimeInterval, repeats: Bool, async: Bool, target: AnyObject, selector: Selector) -> String?**
```Swift
JGTimer.executeTask(start: 1, interval: 1, repeats: true, async: true, target: self, selector: #selector(doTask))
```
