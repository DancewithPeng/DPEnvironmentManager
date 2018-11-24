//
//  Environment.swift
//  EnvironmentManager
//
//  Created by DancewithPeng on 2018/11/22.
//  Copyright © 2018 DP. All rights reserved.
//

import Foundation


/// 环境
public protocol Environment: Codable {
    
    /// 创建环境对象的便捷方法
    ///
    /// - Returns: 返回创建好的环境对象
    static func environment() -> Self
}
