//
//  AcronymSearchRepositoryContainerTest.swift
//  AcronymApplicationTests
//


import XCTest
@testable import AcronymApplication

class AcronymSearchRepositoryContainerTest: XCTestCase {
    func test_AcronymSearchRepositoryContainerTest_Success() {
        let acronymRepoMock = AcronymSearchRepositoryMock()
        let repoContainer = AcronymSearchRepositoryContainer(acronymSearchRepository: acronymRepoMock)
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        repoContainer.getAcronymList(searchStr: "FBI", { (result) in
            switch result {
            case .success(let acronymList) :
                XCTAssert((acronymList as Any) is [AcronymsUsablesModel], "return value should be acronymList")
                expectSuccess.fulfill()
            case .failure :
                XCTFail("Return value should not be error type")
            }
            self.wait(for: [expectSuccess], timeout: 2.0)
        })
    }
    func test_AcronymSearchRepositoryContainerTest_Failure() {
        let acronymRepoMock = AcronymSearchRepositoryMock(fetchAcronymSearchRepositoryResult: .failureWithError)
        let repoContainer = AcronymSearchRepositoryContainer(acronymSearchRepository: acronymRepoMock)
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        repoContainer.getAcronymList(searchStr: "FBI", { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let error):
                expectFailure.fulfill()
                XCTAssert((error as Any) is Error, "return value should not be error type")
            }
            self.wait(for: [expectFailure], timeout: 2.0)
        })
        
    }
}
