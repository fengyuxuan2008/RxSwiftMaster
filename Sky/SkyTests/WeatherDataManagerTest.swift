//
//  WeatherDataManagerTest.swift
//  SkyTests
//
//  Created by apple on 2020/8/7.
//  Copyright © 2020 Mars. All rights reserved.
//

import XCTest
@testable import Sky

class WeatherDataManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //添加测试用例
    func test_weatherDataAt_starts_the_session(){
        let session = MockURLSession()
        let dataTask = MockURLSessionDataTask()
        
        session.sessisonDataTask = dataTask
        
        let manager = WeatherDataManager(baseURL: URL(string: "https://darksky.net")!, urlSession: session)
        
        manager.weatherDataAt(latitude: 100, longitude: 55, completion: {
            _,_ in
        })
        
        XCTAssert(session.sessisonDataTask.isResumeCalled)
        
    }
    
}
