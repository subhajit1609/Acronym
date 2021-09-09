//
//  AcronymSearchInteractorTest.swift
//  AcronymApplicationTests
//



import XCTest
@testable import AcronymApplication

class AcronymSearchInteractorTest: XCTestCase {
    var  acronymSearchInteractor: AcronymSearchInteractor!
    var acronymSearchRepositoryContainer: AcronymSearchRepositoryContainerMock!
    var acronymSearchPresenter: AcronymSearchPresenterListener!
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//    }
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        acronymSearchRepositoryContainer = nil
//        acronymSearchInteractor = nil
//    }
    func test_AcronymSearchInteractorTest_Success() {
        acronymSearchRepositoryContainer = AcronymSearchRepositoryContainerMock()
        acronymSearchPresenter = AcronymSearchPresenterMock()
        acronymSearchInteractor = AcronymSearchInteractor(repositoryContainer: acronymSearchRepositoryContainer)
        acronymSearchInteractor.getAcronymList(searchStr: "FBI")
        
        let longFormModel = AcronymModel(longForm: "Federal Bureau of Investigation")
        let model = AcronymsUsablesModel(shortForm: "FBI", longformList: [longFormModel])
        
        acronymSearchPresenter.displayMessages(viewModels: [model])
        if let presenter = acronymSearchPresenter as? AcronymSearchPresenterMock {
            XCTAssertTrue(presenter.isdisplayMessagesCalled,
                          "Should be true, Becuase after setting data we are calling func")
        }
        
    }

    
    func test_AcronymSearchInteractorTest_Failure() {
        acronymSearchRepositoryContainer = AcronymSearchRepositoryContainerMock(fetchAcronymSearchRepositoryResult: .failureWithError)
        acronymSearchPresenter = AcronymSearchPresenterMock()
        acronymSearchInteractor = AcronymSearchInteractor(repositoryContainer: acronymSearchRepositoryContainer)
        acronymSearchInteractor.getAcronymList(searchStr: "FBI")
        acronymSearchPresenter.displayErrorMessages(error: AcronymApplicationError.connectionError)
        if let presenter = acronymSearchPresenter as? AcronymSearchPresenterMock {
            XCTAssertTrue(presenter.isdisplayErrorMessagesCalled,
                          "Should be true, Becuase after setting data we are calling func")
        }
        
}

}
