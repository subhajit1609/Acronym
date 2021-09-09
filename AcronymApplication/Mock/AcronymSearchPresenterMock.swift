//
//  AcronymSearchPresenterMock.swift
//  AcronymApplication
//

import Foundation
class AcronymSearchPresenterMock: AcronymSearchPresenterListener {
    var isdisplayMessagesCalled: Bool = false
    var displayModel: [AcronymsUsablesModel]?
    func displayMessages(viewModels: [AcronymsUsablesModel]) {
        isdisplayMessagesCalled = true
        displayModel = viewModels
    }
    var isdisplayErrorMessagesCalled: Bool = false
    var errorMessage: Error?
    func displayErrorMessages(error: Error) {
        isdisplayErrorMessagesCalled = true
        errorMessage = error
    }
}
