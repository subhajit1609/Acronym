//
//  AcronymSearchViewController.swift
//  AcronymApplication
//


import UIKit

/// This class will contain the attributes and behaviours for module
class AcronymSearchViewController: UIViewController {
    var presenter: AcronymSearchPresentable?
    override func viewDidLoad() {
        super.viewDidLoad()
        AcronymSearchBuilder().configure(viewController: self)
        (self.view as? AcronymSearchView)?.configureView()
        (self.view as? AcronymSearchView)?.delegate = self
    }
    
    deinit { print("AcronymSearchViewController") }
}

private extension AcronymSearchViewController {
    
    /// Fetch the data and reload the view.
    func loadAcronymList(searchText: String) {
        presenter?.getAcronymList(inputStr: searchText)
    }
}

extension AcronymSearchViewController: AcronymSearchViewControllerListener {
    func displayMessages(viewModels: [AcronymModel]) {
        DispatchQueue.main.async {
            (self.view as? AcronymSearchView)?.updateAcronymSearchViewModel(viewModels: viewModels)
        }
    }
    
    func displayErrorMessages(error: Error) {
        
    }
}
extension AcronymSearchViewController: AcronymSearchTextProtocol {
    func acronymsSearchTex(searchText: String) {
        loadAcronymList(searchText: searchText.capitalized)
    }
}

