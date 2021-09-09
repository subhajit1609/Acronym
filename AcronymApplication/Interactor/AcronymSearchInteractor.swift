//
//  AcronymSearchInteractor.swift
//  AcronymApplication
//


import Foundation

/// This protocol will contain business logics methods.
///
/// Types that conform to the `AcronymSearchInteractable` protocol, that class can implement the methods.
protocol AcronymSearchInteractable {
    // TODO: Declare methods the interactor will implement.
     func getAcronymList(searchStr: String)
}

/// This protocol will contain presenter logics callback methods.
///
/// Types that conform to the `AcronymSearchPresenterListener` protocol, that class can implement the methods.
/// This protocls will help to presenter to present the data
protocol AcronymSearchPresenterListener: AnyObject {
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func displayMessages(viewModels: [AcronymsUsablesModel])
    func displayErrorMessages(error: Error)
}

/// This class will handle business logic implemenation.
///
/// Interactor will help to get the data from data layer (API/DataBase) and pass back to presenter to present the data.
/// If we want do handle other validation and data formating, that must be handle by helper/common/supporter classes.
///
/// - Note: This class must not contain more then a repository.
final class AcronymSearchInteractor {
    weak var presenter: AcronymSearchPresenterListener?
    private var repositoryContainer: AcronymSearchRepositoryContainerProtocol?

    // initaliser
    required init(repositoryContainer: AcronymSearchRepositoryContainerProtocol?) {
        self.repositoryContainer = repositoryContainer
    }
        
}

extension AcronymSearchInteractor: AcronymSearchInteractable {
    func  getAcronymList(searchStr: String) {
        repositoryContainer?.getAcronymList(searchStr: searchStr, {
              [weak self]  (result) in
                switch result {
                case .success(let acronymsModel):
                    self?.presenter?.displayMessages(viewModels: acronymsModel)
                case .failure(let error):
                    self?.presenter?.displayErrorMessages(error: error)
                }
            })
        }
}
