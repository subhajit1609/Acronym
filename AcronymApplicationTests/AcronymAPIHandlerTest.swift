//
//  AcronymAPIHandlerTest.swift
//  AcronymApplicationTests
//


import XCTest
@testable import AcronymApplication

class AcronymAPIHandlerTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testGetAcronymListSuccess() {
        let session = AcronymSearchUrlSessionMock.getAcronymList(resultType: .apiSuccess)
        let apiHandler = AcronymAPIHandler(session: session, remoteMapper: AcronymSearchRemoteDataMapper())
        let expectation = XCTestExpectation(description: "Expectation-GetAcronymSearchListSuccess")
        expectation.expectedFulfillmentCount = 1
        let params = AcronymSearchParamater(searchText: "FBI")
        apiHandler.getAcronymList(paramater: params) { (result) in
            switch result {
            case .success(let arrayModel):
                XCTAssertTrue(arrayModel.count > 0, "Array should contains object")
            case .failure(let error):
                XCTFail("It should not fail \(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    func testGetAcronymListFailure() {
        let session = AcronymSearchUrlSessionMock.getAcronymList(resultType: .invalidData)
        let apiHandler = AcronymAPIHandler(session: session, remoteMapper: AcronymSearchRemoteDataMapper())
        let expectation = XCTestExpectation(description: "Expectation-GetAcronymSearchListFailure")
        expectation.expectedFulfillmentCount = 1
        let params = AcronymSearchParamater(searchText: "FBI")
        apiHandler.getAcronymList(paramater: params) { (result) in
            switch result {
            case .success:
                XCTFail("It should not success")
            case .failure(let error):
                XCTAssertNotNil(error, "It should return error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
