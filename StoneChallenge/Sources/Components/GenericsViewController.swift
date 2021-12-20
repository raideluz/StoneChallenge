//
//  GenericsViewController.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 18/12/21.
//

import UIKit

class GenericsViewController<T: UIView>: UIViewController {
    
    var contentView = T()
    
    override func loadView() {
        self.view = contentView
    }
}
