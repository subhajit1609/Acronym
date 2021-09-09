//
//  AcronymSearchRemoteDataStoreTest.swift
//  AcronymApplicationTests
//


import XCTest
@testable import AcronymApplication

class AcronymSearchRemoteDataStoreTest: XCTestCase {
    func test_GetAcronymSearchRemotesSuccess() {
        let apiHandler = AcronymAPIHandlerMock(fetchAcronymSearchAPIResult: .successWithValue)
        let remoteDataStore = AcronymSearchRemoteStore(apiHandler: apiHandler)
        let parameter = AcronymSearchParamater(searchText: "FBI")
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        remoteDataStore.getAcronymList(paramater: parameter) { (result) in
            switch result {
            case .success:
                expectSuccess.fulfill()
            case .failure(let failure):
                XCTFail("Should not receive failure - \(failure)")
            }
        }
        wait(for: [expectSuccess], timeout: 1.0)
    }
    
    func test_GetAcronymSearchRemotesFailure() {
        let apiHandler = AcronymAPIHandlerMock(fetchAcronymSearchAPIResult: .failureWithError)
        let remoteDataStore = AcronymSearchRemoteStore(apiHandler: apiHandler)
        let parameter = AcronymSearchParamater(searchText: "FBI")
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        remoteDataStore.getAcronymList(paramater: parameter) { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let failure):
                expectFailure.fulfill()
                XCTAssert((failure as Any) is Error, "return value should not be error type")
            }
        }
        wait(for: [expectFailure], timeout: 1.0)
    }
}
