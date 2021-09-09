//
//  AcronymSearchPresenterTest.swift
//  AcronymApplicationTests
//

import XCTest
@testable import AcronymApplication

class AcronymSearchPresenterTest: XCTestCase {
    var  acronymSearchPresenter: AcronymSearchPresenter!
    var acronymSearchViewController: AcronymSearchControllerMock!
    var acronymSearchInteractor: AcronymSearchInteractorMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        acronymSearchViewController = AcronymSearchControllerMock()
        acronymSearchInteractor = AcronymSearchInteractorMock()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        acronymSearchViewController = nil
        acronymSearchInteractor = nil
        acronymSearchPresenter = nil
    }
    func test_AcronymSearchPresenterTest_Success() {
        acronymSearchPresenter = AcronymSearchPresenter(interactor: acronymSearchInteractor, viewController: acronymSearchViewController)
        let longFormModel = AcronymModel(longForm: "Federal Bureau of Investigation")
        let model = AcronymsUsablesModel(shortForm: "FBI", longformList: [longFormModel])
        acronymSearchPresenter.displayMessages(viewModels: [model])
        XCTAssertTrue(acronymSearchViewController.isdisplayMessagesCalled,
                      "Should be true, Becuase after setting data we are calling func")
        XCTAssertTrue(acronymSearchViewController.displayModel?.first?.longForm == "Federal Bureau of Investigation")
    }
    func test_AcronymSearchPresenterGetAcronymList_Success() {
        acronymSearchPresenter = AcronymSearchPresenter(interactor: acronymSearchInteractor, viewController: acronymSearchViewController)
        acronymSearchPresenter.getAcronymList(inputStr: "FBI")
        XCTAssertTrue(acronymSearchInteractor.isgetAcronymListCalled,
                      "Should be true, Becuase after setting data we are calling func")
    }
    func test_AcronymSearchPresenterTest_Error() {
        acronymSearchPresenter = AcronymSearchPresenter(interactor: acronymSearchInteractor, viewController: acronymSearchViewController)
        acronymSearchPresenter.displayErrorMessages(error: AcronymApplicationError.connectionError)
        XCTAssertTrue(acronymSearchViewController.isdisplayErrorMessagesCalled,
                      "Should be true, Becuase after setting error we are calling func")
        XCTAssertTrue(acronymSearchViewController.errorMessage as? AcronymApplicationError == AcronymApplicationError.connectionError)
    }
}
