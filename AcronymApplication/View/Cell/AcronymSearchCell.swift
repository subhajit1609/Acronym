//
//  AcronymSearchCell.swift
//  AcronymApplication
//


import UIKit

class AcronymSearchCell: UITableViewCell {
    @IBOutlet var acronymLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func data(viewModel: AcronymModel) {
        acronymLabel.text = viewModel.longForm?.capitalized
    }
    
}
