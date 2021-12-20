//
//  DetailsViewController.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 18/12/21.
//

import UIKit

// MARK: - Class

class DetailsViewController: GenericsViewController<DetailsView> {
    
    // MARK: - Properties
    var viewModel: DetailsViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        guard let details = viewModel?.details else {
            return
        }
        contentView.setup(data: details)
    }
}
