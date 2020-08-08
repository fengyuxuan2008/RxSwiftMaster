//
//  URLSessionProtocol.swift
//  Sky
//
//  Created by apple on 2020/8/8.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias dataTaskHandler = (Data?, URLResponse?, Error?) -> Void
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping dataTaskHandler)
        -> URLSessionDataTaskProtocol
}
