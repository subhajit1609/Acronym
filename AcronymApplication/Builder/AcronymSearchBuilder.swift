//
//  AcronymSearchBuilder.swift
//  AcronymApplication
//


import Foundation
import UIKit

/// This protocol will contain builder logic methods.
protocol AcronymSearchBuildable {
    // TODO: Declare methods the builder will implement.
    func configure(viewController: AcronymSearchViewController)
}

/// This class will handle builder logic implemenation
///
/// Builder will help to injected the all the dependences, which will requried for module. For example:
///
///
/// It will reture the optional view controller.
final class AcronymSearchBuilder: AcronymSearchBuildable {
    
    func configure(viewController: AcronymSearchViewController) {
        let repositoryContainer = AcronymSearchRepositoryContainerFactory().makeRepositoryContainerFactory()
        let interactor = AcronymSearchInteractor(repositoryContainer: repositoryContainer)
        let presenter = AcronymSearchPresenter(interactor: interactor,
                                      viewController: viewController)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
    
    deinit { print("AcronymSearchBuilder") }
}
