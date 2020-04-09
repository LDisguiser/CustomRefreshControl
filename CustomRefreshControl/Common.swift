//
//  Common.swift
//  CustomRefreshControl
//
//  Created by 李贺 on 2020/4/7.
//  Copyright © 2020 Heli. All rights reserved.
//

import UIKit

/// 判断是否为刘海屏幕
@available(iOS 11.0, *)
func iPhoneXSeries() -> Bool{
    let insets = UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    return insets.bottom > CGFloat(0) ? true : false
}

/// 刘海高度
let AdaptNaviHeight = iPhoneXSeries() ? 24 : 0
/// 导航栏高度
let NaviHeight = iPhoneXSeries() ? 88 : 64
/// x 系列标签栏 底部横岗的高度
let AdaptTabHeight = iPhoneXSeries() ? 34 : 0
/// 标签栏高度
let TabBarHeight = iPhoneXSeries() ? 83 : 49
