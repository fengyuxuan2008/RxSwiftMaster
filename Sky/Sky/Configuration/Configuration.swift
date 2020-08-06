//
//  Configuration.swift
//  Sky
//
//  Created by apple on 2020/8/6.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation

struct API {
    static let key = "af7aa5cfc14d558e720caff21791f148"
    static let baseURL = URL(string: "https://api.darksky.net/forecast/")!
    static let authenticatedURL = baseURL.appendingPathComponent(key)
}
