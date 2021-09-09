//
//  AcronymSearchTableViewServices.swift
//  AcronymApplication
//



import UIKit

/// This class holds all the services provided by MessageCentreController.

final class AcronymSearchTableViewServices: NSObject {
    var mainTableView: UITableView?
    var acronymViewModel = [AcronymModel]()
    func configureTableView(tableView: UITableView) {
        self.mainTableView = tableView
        configureNibs(tableView: self.mainTableView)
    }
    func updateMessageViewModel(viewModels: [AcronymModel]) {
        acronymViewModel = viewModels
        mainTableView?.reloadData()
    }
}

private extension AcronymSearchTableViewServices {
    
    func configureNibs(tableView: UITableView?) {
        let messageListTableViewCell = UINib(nibName: AcronymSearchCell.identifier, bundle: Bundle.main)
        tableView?.register(messageListTableViewCell, forCellReuseIdentifier: AcronymSearchCell.identifier)
    }
}

extension AcronymSearchTableViewServices: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  acronymViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AcronymSearchCell.identifier, for: indexPath) as? AcronymSearchCell else {
            return UITableViewCell()
        }
        cell.data(viewModel: acronymViewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension AcronymSearchTableViewServices: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

