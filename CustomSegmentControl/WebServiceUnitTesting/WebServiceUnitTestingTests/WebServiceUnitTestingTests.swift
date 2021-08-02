//
//  WebServiceUnitTestingTests.swift
//  WebServiceUnitTestingTests
//
//  Created by Ankur Chauhan on 8/1/21.
//

import XCTest
@testable import WebServiceUnitTesting

class WebServiceUnitTestingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWebserviceResponse() throws {
        let url = URL(string: "https://www.yoururl.com")!
        let data = Data()
        let response = HTTPURLResponse(url: URL(string: "https://github.com")!, statusCode: 201, httpVersion: nil, headerFields: nil)
        URLProtocolMock.mockURLs = [url: (nil, data, response)]
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolMock.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        let exp = expectation(description: "Loading stories")

        ApiService(session: mockSession).getDataFromUrl(url: url) { response, error in
            XCTAssertNil(error)
            XCTAssertEqual(200, response?.statusCode)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
}
