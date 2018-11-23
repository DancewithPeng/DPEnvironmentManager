//
//  EnvironmentManager.swift
//  EnvironmentManager
//
//  Created by DancewithPeng on 2018/11/22.
//  Copyright © 2018 DP. All rights reserved.
//

import Foundation

/// 环境管理器
open class EnvironmentManager {
    
    /// 环境对象
    fileprivate static var environment: Environment? = nil { didSet { environmentDidChange(environment) } }
    
    /// 当前环境
    public static var currentEnvironment: Environment? {
        return environment
    }
    
    /// 更新环境
    ///
    /// - Parameter environment: 环境对象
    public static func updateEnvironment(_ environment: Environment) {
        self.environment = environment
    }
    
    /// 环境改变
    ///
    /// - Parameter environment: 环境对象
    fileprivate static func environmentDidChange(_ environment: Environment?) {
        NotificationCenter.default.post(name: environmentDidChangeNotification, object: environment, userInfo: environment != nil ? ["environment": environment!] : nil)
    }
}


// MARK: - 环境管理器相关通知
public extension EnvironmentManager {
    
    /// 环境变更通知
    public static let environmentDidChangeNotification = NSNotification.Name("EnvironmentManager.environmentDidChangeNotification")
}
