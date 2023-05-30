//
//  CachesHelper.swift
//  Bricks
//
//  Created by Ido on 01/12/2021.
//  Copyright © 2022 Bricks Ltd. All rights reserved.
//

import Foundation
import DSLogger

fileprivate let dlog : DSLogger? = DLog.forClass("CachesHelper")

class MNCachesHelper : NSObject {
    var observers = ObserversArray<MNCachesEventObserver>()
    
    // MARK: Singleton
    public static let shared = MNCachesHelper()
    
    // MARK: Lifecycle
    override private init(){
        super.init()
        //AppEventsManager.shared.observers.addObserver(self)
    }
    
    deinit {
        //AppEventsManager.shared.observers.removeObserver(self)
    }
    
    // MARK: Debugging
//    func debugLogCachNamesAndCapacicites() {
//        self.observers.enumerateOnMainThread { (observer) in
//            if let cache = observer as? AnyCache {
//                dlog?.info("cache: [\(cache.name)] contains: \(cache.count) / \(cache.maxSize)")
//            }
//        }
//    }
}

protocol MNCachesEventObserver {
    func applicationDidReceiveMemoryWarning(_ application: Any)
}

//extension MNCachesHelper : AppEventsObserver {
//
//    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
//        dlog?.info("applicationDidReceiveMemoryWarning:")
//        self.debugLogCachNamesAndCapacicites()
//        observers.enumerateOnMainThread { (observer) in
//            observer.applicationDidReceiveMemoryWarning(application)
//        }
//    }
//}

extension MNCachesHelper : MNCacheObserver {
    
    
    func cacheWasLoaded(uniqueCacheName: String, keysCount: Int, error: MNCacheError?) {
        // ?
    }
    
    func cacheItemsUpdated(uniqueCacheName: String, updatedItems: [AnyHashable : Any]) {
        // ?
    }
    
    
    func cacheItemUpdated(uniqueCacheName: String, key: Any, value: Any) {
        // ?
    }
    
    func cacheWasCleared(uniqueCacheName: String) {
        // ?
    }
    
    func cacheItemsWereRemoved(uniqueCacheName: String, keys: [Any]) {
        // ?
    }
    
}
