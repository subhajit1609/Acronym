//
//  APIURLRequestCreaterTest.swift
//  AcronymApplicationTests
//

import Foundation
import XCTest
@testable import AcronymApplication
class OEStringTests: XCTestCase {
   
    func testForValidUrl() {
        let fullUrl = "https://test.com"
        XCTAssertTrue(fullUrl.isValidURL, "Failed url should be valid")
    }
}
class APIURLRequestCreaterTests: XCTestCase {
    var urlRequestCreater: APIURLRequestCreater?
    var mockRequestCreater: APIConfigurableProtocol?
    override func setUp() {
            urlRequestCreater = APIURLRequestCreater()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        //Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrlRequestBodyWithoutParameter() {
        XCTAssertThrowsError(try  urlRequestCreater?.createRequest(request: MockAPIConfigurator(mockEnum: .bodyWithoutParameter)))

    }
    func testUrlRequestQueryWithoutParameter() {
        XCTAssertThrowsError(try  urlRequestCreater?.createRequest(request:MockAPIConfigurator(mockEnum: .queryWithoutParameter)))
    }
    func testUrlRequestBodyWithoutValue() {
        XCTAssertThrowsError(try  urlRequestCreater?.createRequest(request: MockAPIConfigurator(mockEnum: .bodyWithoutValue)))
    }
    func testUrlRequestQueryWithParameter() {
        XCTAssertNoThrow( try urlRequestCreater?.createRequest(request: MockAPIConfigurator(mockEnum: .queryWithParameter)))
    }

    func testUrlRequest() {
        XCTAssertNoThrow( try urlRequestCreater?.createRequest(request: MockAPIConfigurator(mockEnum: .allValid)))
    }

}
class UrlRequestErrorTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        //Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testForBodyWithoutParameterError() {
        XCTAssertTrue(UrlRequestError.bodyWithoutParameter.localizedDescription.isEqualToString(find: "Body without parameter , Please provide parameter to create body in url request."))
    }
    func testForBadUrlError() {
        XCTAssertTrue(UrlRequestError.badUrl.localizedDescription.isEqualToString(find: "Invalid url, Please provide valid url to create url request."))
    }
    func testForBodyWithoutValueError() {
        XCTAssertTrue(UrlRequestError.bodyWithoutValue.localizedDescription.isEqualToString(find: "Body without value, Please provide values in parameter to create body in  Url request."))
    }
    func testForNoHeadersError() {
        XCTAssertTrue(UrlRequestError.noHeaders.localizedDescription.isEqualToString(find: "No Header, Please provide header to create Url request"))
    }
}

