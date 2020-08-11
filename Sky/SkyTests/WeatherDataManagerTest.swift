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
    
    let url = URL(string: "https://darksky.net")!
    var session: MockURLSession!
    var manager: WeatherDataManager!

    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.session = MockURLSession()
        self.manager = WeatherDataManager(baseURL: url, urlSession: session)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //添加测试用例
    func test_weatherDataAt_starts_the_session(){
        let dataTask = MockURLSessionDataTask()
        
        session.sessisonDataTask = dataTask
        
        manager.weatherDataAt(latitude: 100, longitude: 55, completion: {
            _,_ in
        })
        
        XCTAssert(session.sessisonDataTask.isResumeCalled)
        
    }
    
    //如何在单元测试中处理异步回调函数
    //xcode的测试用例是单线程执行的
    //第一种方法 使用Xcode expectation 在时间范围内设置期望，如果期望满足就表示测试成功，否则，测试失败
//    func test_weatherDataAt_gets_data() {
//        var data: WeatherData? = nil
//        let expect = expectation(description: "Loading data from \(API.authenticatedURL)")
//        WeatherDataManager.shared.weatherDataAt(latitude: 100, longitude: 55, completion: {
//            response, error in data = response
//            expect.fulfill()// - Notify Xcode here
//        })
//
//        waitForExpectations(timeout: 5, handler: nil)
//        XCTAssertNotNil(data)
//    }
    
    //第二种方法 通过mock串行化异步执行的代码
    
    //测试可以正确的处理请求错误
    func test_weatherDataAt_handle_invalid_request() {
        session.responseError = NSError(domain: "Invalid", code: 100, userInfo: nil)
        
        var error: DataManagerError? = nil
        manager.weatherDataAt(latitude: 52, longitude: 100, completion: {(_, e) in error = e})
        
        XCTAssertEqual(error, DataManagerError.failedRequest)
        
    }
    
    //测试可以正确处理服务器返回的状态码
    func test_weatherDataAt_handle_statuscode_not_equal_to_200() {
       
        session.responseHeader = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
            
        let data = "{}".data(using: .utf8)!
        session.responseData = data
        
        var error: DataManagerError? = nil
        
        manager.weatherDataAt(latitude: 52, longitude: 100, completion: {
            (_, e) in error = e
        })
        
        XCTAssertEqual(error, DataManagerError.failedRequest)
    }
    
    
    //测试服务器返回的内容不正确
    func test_weatherDataAt_handle_invalid_response() {
      
        session.responseHeader = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
       
        /// Make a invalid JSON response here
        let data = "{".data(using: .utf8)!
        session.responseData = data
        
        var error: DataManagerError? = nil
       
        manager.weatherDataAt(latitude: 52, longitude: 100, completion: {
            (_, e) in error = e
        })
        
        XCTAssertEqual(error, DataManagerError.invalidResponse)
    }
    
    //测试可以正确解码服务器返回值
    func test_weatherDataAt_handle_response_decode() {
        session.responseHeader = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
      
        let data = """
        {
            "longitude" : 100,
            "latitude" : 52,
            "currently" : {
                "temperature" : 23,
                "humidity" : 0.91,
                "icon" : "snow",
                "time" : 1507180335,
                "summary" : "Light Snow"
            }
            "daily": {
                "data": [
                    {
                        "time": 1507180335,
                        "icon": "clear-day",
                        "temperatureLow": 66,
                        "temperatureHigh": 82,
                        "humidity": 0.25
                    }
                ]
            }
        }
        """.data(using: .utf8)!
        session.responseData = data
        
        var decoded: WeatherData? = nil
        
        manager.weatherDataAt(latitude: 52, longitude: 100, completion: {
            (d, _) in decoded = d
        })
        
        let expectedWeekData = WeatherData.WeekWeatherData(data: [
        ForecastData(
            time: Date(timeIntervalSince1970: 1507180335),
            temperatureLow: 66,
            temperatureHigh: 82,
            icon: "clear-day",
            humidity: 0.25)
        ])
        
        let expected = WeatherData(latitude: 52, longitude: 100, currently: WeatherData.CurrentWeather(
            time: Date(timeIntervalSince1970: 1507180335),
            summary: "Light Snow",
            icon: "snow",
            temperature: 23,
            humidity: 0.91),
        daily: expectedWeekData)
        
        XCTAssertEqual(decoded, expected)
    }
}
