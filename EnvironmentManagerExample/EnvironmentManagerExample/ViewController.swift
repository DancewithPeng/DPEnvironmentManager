//
//  ViewController.swift
//  EnvironmentManagerExample
//
//  Created by DancewithPeng on 2018/11/22.
//  Copyright © 2018 DP. All rights reserved.
//

import UIKit
import EnvironmentManager

//extension EnvironmentAttribute {
//    case serverAPIVersion
//}


struct DebugEnvironment: Environment {
    
    func value(for attribute: EnvironmentAttribute) -> String {
        return ""
    }
    
    static func environment() -> DebugEnvironment {
        return DebugEnvironment()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc
    func handle(_ notification: Notification) {
        
    }
}

