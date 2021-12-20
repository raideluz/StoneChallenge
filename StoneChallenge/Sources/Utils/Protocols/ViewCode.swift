//
//  ViewCode.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 16/12/21.
//

import Foundation

protocol ViewCode {
    func setupHierarchy()
    func setupConstraints()
    func setupView()
    func additionalSettings()
}

extension ViewCode {
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        additionalSettings()
    }
    
    func additionalSettings() {
        // implementação vazia caso não seja necessária.
    }
}
