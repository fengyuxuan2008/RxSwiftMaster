//
//  MockURLSession.swift
//  SkyTests
//
//  Created by apple on 2020/8/8.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation
@testable import Sky

class MockURLSession:  URLSessionProtocol{
    var sessisonDataTask = MockURLSessionDataTask()
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.dataTaskHandler) -> URLSessionDataTaskProtocol {
        return sessisonDataTask
    }
}
