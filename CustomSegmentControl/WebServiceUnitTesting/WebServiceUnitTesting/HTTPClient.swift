//
//  HTTPClient.swift
//  WebServiceUnitTesting
//
//  Created by Ankur Chauhan on 8/1/21.
//

import Foundation

// deprecated way
protocol URLSessionProtocol {
    func dataTask(with: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    func dataTask(with: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTask()
    }
}

/*
override func setUp() {
    super.setUp()
    baseURL = URL(string: "https://example.com/api/v1")!
    mockSession = MockURLSession()
    sut = NetworkService()
}

override func tearDown() {
    baseURL = nil
    mockSession = nil
    sut = nil
    super.tearDown()
}
*/
class MockURLSession: URLSession {
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(completionHandler: completionHandler, url: url)
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var url: URL
    
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void, url: URL) {
        self.completionHandler = completionHandler
        self.url = url
    }
    
    var calledResume = false
    override func resume() {
        calledResume = true
    }
}

