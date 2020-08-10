//
//  Double.swift
//  Sky
//
//  Created by apple on 2020/8/9.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation

extension Double {
    func toCelsius() -> Double {
        return (self - 32.0) / 1.8
    }
}
