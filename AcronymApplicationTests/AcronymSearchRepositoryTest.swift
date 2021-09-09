//
//  AcronymSearchRepositoryTest.swift
//  AcronymApplicationTests
//


import XCTest
@testable import AcronymApplication

class AcronymSearchRepositoryTest: XCTestCase {
    
    func test_AcronymSearchRepositoryTest_Success() {
        let remoteDataStore = AcronymSearchRemoteDatastoreMock()
        let repository = AcronymSearchRepository(acronymSearchRemote: remoteDataStore)
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        repository.fetchAcronymList(searchStr: "FBI", { (result) in
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
    func test_AcronymSearchRepositoryTest_Failure() {
        let remoteDataStore = AcronymSearchRemoteDatastoreMock(fetchAcronymSearchRemoteResult: .failureWithError)
        let repository = AcronymSearchRepository(acronymSearchRemote: remoteDataStore)
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        repository.fetchAcronymList(searchStr: "FBI", { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let error):
                expectFailure.fulfill()
                XCTAssert((error as Any) is Error, "return value should be error type")
            }
            self.wait(for: [expectFailure], timeout: 2.0)
        })
        
    }

}
