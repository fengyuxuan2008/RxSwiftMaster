//
//  MockURLSessionDataTask.swift
//  SkyTests
//
//  Created by apple on 2020/8/8.
//  Copyright © 2020 Mars. All rights reserved.
//

import Foundation
@testable import Sky

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var isResumeCalled = false
    
    func resume() {
        self.isResumeCalled = true
    }
}
