//
//  JGTimer.swift
//  TimerDemo
//
//  Created by JanyGee on 2021/7/16.
//

import Foundation

class JGTimer: NSObject {

    static var timers_: [String: DispatchSourceTimer] = [String: DispatchSourceTimer]()
    static let semaphore_: DispatchSemaphore = DispatchSemaphore(value: 1)

    class func executeTask(start: TimeInterval, interval: TimeInterval, repeats: Bool, async: Bool, task: @escaping ()->Void) -> String? {
        if (start < 0 || (interval <= 0 && repeats)) {return nil}

        let queue = async ? DispatchQueue.global(qos: .unspecified) : DispatchQueue.main
        
        let timer = DispatchSource.makeTimerSource(flags: .strict, queue: queue)
        
        timer.schedule(deadline: .now() + start, repeating: interval)
        
        semaphore_.wait()
        
        let name = "\(timers_.count)"
        
        timers_[name] = timer
        
        semaphore_.signal()
        
        timer.setEventHandler {
            task()
            
            if repeats == false {
                cancelTask(name: name)
            }
        }
        
        timer.resume()
        
        return name
    }
    
    class func executeTask(start: TimeInterval, interval: TimeInterval, repeats: Bool, async: Bool, target: AnyObject, selector: Selector) -> String? {
        
        return executeTask(start: start, interval: interval, repeats: repeats, async: async) {
            _ = target.perform(selector)
        }
    }
    
    class func cancelTask(name: String) -> Void {
        if name.count == 0 {
            return
        }
        
        semaphore_.wait()
        
        if let timer = timers_[name] {
            timer.cancel()
            timers_.removeValue(forKey: name)
        }
        
        semaphore_.signal()
    }
}
