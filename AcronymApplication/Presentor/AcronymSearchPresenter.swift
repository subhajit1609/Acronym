//
//  AcronymSearchPresenter.swift
//  AcronymApplication
//


import Foundation

/// This protocol will contain presenter logics methods.
///
/// Types that conform to the `AcronymSearchPresentable` protocol, that class can implement the methods.
protocol AcronymSearchPresentable {
    // TODO: Declare methods the presenter will implement.
    func getAcronymList(inputStr: String)
}

/// This protocol will contain display logics callback methods.
///
/// Types that conform to the `AcronymSearchViewControllerListener` protocol, that class can implement the methods.
/// This protocls will help to view controller to display the data.
protocol AcronymSearchViewControllerListener: AnyObject {
    // TODO: Declare methods the presenter can invoke the viewcontroller to display data.
    func displayMessages(viewModels: [AcronymModel])
    func displayErrorMessages(error: Error)
}

/// This class will handle presenter logic implemenation.
///
/// Presenter will help to get the data from interactor and responsible to convert the entity into viewmodel.
/// We are handling router from presenter to move other screens.
/// If we want do handle other validation and data formating, that must be handle by helper/common/supporter classes.
final class AcronymSearchPresenter {
    
    private var interactor: AcronymSearchInteractable
    private unowned var viewController: AcronymSearchViewControllerListener
    
    init(interactor: AcronymSearchInteractable,
         viewController: AcronymSearchViewControllerListener) {
        self.interactor = interactor
        self.viewController = viewController
    }
    
    deinit { print("AcronymSearchPresenter") }
}

extension AcronymSearchPresenter: AcronymSearchPresentable {
    func getAcronymList(inputStr: String) {
        self.interactor.getAcronymList(searchStr: inputStr)
    }
}

extension AcronymSearchPresenter: AcronymSearchPresenterListener {
    func displayMessages(viewModels: [AcronymsUsablesModel]) {
        if let viewModel = viewModels.first {
            viewController.displayMessages(viewModels:viewModel.longformList)
        }
    }
    func displayErrorMessages(error: Error) {
        viewController.displayErrorMessages(error: error)
    }
}
