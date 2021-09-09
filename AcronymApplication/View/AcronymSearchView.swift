//
//  AcronymSearchView.swift
//  AcronymApplication
//



import UIKit
protocol AcronymSearchTextProtocol: AnyObject {
    func acronymsSearchTex(searchText: String)
}
/// This class will contain the UI elements.
class AcronymSearchView: UIView {
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    weak var delegate: AcronymSearchTextProtocol?
    lazy private var mainTableViewServices: AcronymSearchTableViewServices = {
        return AcronymSearchTableViewServices()
    }()
    lazy private var searchBarServices: AcronymSearchBarServices = {
        return AcronymSearchBarServices()
    }()
    func configureView() {
        searchBar.delegate = searchBarServices
        mainTableView.delegate = mainTableViewServices
        mainTableView.dataSource = mainTableViewServices
        mainTableViewServices.configureTableView(tableView: mainTableView)
        searchBarServices.configureSearchBar(searchBar: searchBar)
        searchBarServices.delegate = self
    }
    
    func reloadTableView() {
        mainTableView.reloadData()
    }
    /// This function is used to update the view with utn view model data.
    /// - Parameter viewModel: instance of type **MessageViewModel** that holds utn details.
    func updateAcronymSearchViewModel(viewModels: [AcronymModel]) {
        mainTableViewServices.updateMessageViewModel(viewModels: viewModels)
        reloadTableView()
    }
    deinit { print("AcronymSearchView") }
    
}
extension AcronymSearchView: AcronymSearchBarServicesProtocol {
    func acronymsSearchTextAction(searchText: String?) {
        if let searchText = searchText {
            delegate?.acronymsSearchTex(searchText: searchText)
        }
    }
}
