//
//  AcronymSearchBarServices.swift
//  AcronymApplication
//
import UIKit
protocol AcronymSearchBarServicesProtocol: AnyObject {
    func acronymsSearchTextAction(searchText: String?)
}
final class AcronymSearchBarServices: NSObject {
    var searchBar: UISearchBar?
    weak var delegate: AcronymSearchBarServicesProtocol?
    func configureSearchBar(searchBar: UISearchBar) {
        self.searchBar = searchBar
    }
}
extension AcronymSearchBarServices: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.acronymsSearchTextAction(searchText: searchBar.text)
        searchBar.resignFirstResponder()
    }
}
