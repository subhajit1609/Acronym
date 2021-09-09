//
//  AcronymSearchControllerMock.swift
//  AcronymApplication
//


import Foundation
class AcronymSearchControllerMock: AcronymSearchViewControllerListener {
    var isdisplayMessagesCalled: Bool = false
    var displayModel: [AcronymModel]?
    func displayMessages(viewModels: [AcronymModel]) {
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
