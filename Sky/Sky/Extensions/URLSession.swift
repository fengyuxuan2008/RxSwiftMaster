//
//  URLSession.swift
//  Sky
//
//  Created by apple on 2020/8/8.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping dataTaskHandler) -> URLSessionDataTaskProtocol {
       return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask as URLSessionDataTaskProtocol
    }
}
