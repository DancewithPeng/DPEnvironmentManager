//
//  Environment.swift
//  EnvironmentManager
//
//  Created by DancewithPeng on 2018/11/22.
//  Copyright © 2018 DP. All rights reserved.
//

import Foundation


public enum EnvironmentAttribute: String {
    case `defualt`
}

/// 环境
public protocol Environment {
    
//    /// 服务器域名
//    var serverDomain: String { get }
//
//    /// 服务器API版本
//    var serverAPIVersion: String { get }
//
//    /// App对应的服务器路径
//    var serverAppPath: String { get }
    
    func value(for attribute: EnvironmentAttribute) -> String
    
    /// 创建环境对象的便捷方法
    ///
    /// - Returns: 返回创建好的环境对象
    static func environment() -> Self
}
