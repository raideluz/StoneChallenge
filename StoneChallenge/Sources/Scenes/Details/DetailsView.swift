//
//  DetailsView.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 19/12/21.
//

import UIKit

class DetailsView: UIView {
    
    struct Constant {
        static let padding16: CGFloat = 16
        static let padding8: CGFloat = 8
        static let padding6: CGFloat = 6
        static let fontSize: CGFloat = 22
        static let radius: CGFloat = 8
        static let width: CGFloat = 200
        static let heigthImage: CGFloat = 300
        static let heigthLabel: CGFloat = 40
    }
    
    // MARK: - Properties
    
    private lazy var imageView = buildImageView()
    private lazy var nameLabel = buildLabel()
    private lazy var speciesLabel = buildLabel()
    private lazy var genderLabel = buildLabel()
    private lazy var typeLabel = buildLabel()
    private lazy var statusLabel = buildLabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - ViewCode

extension DetailsView: ViewCode {
    
    func setupHierarchy() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(speciesLabel)
        addSubview(genderLabel)
        addSubview(typeLabel)
        addSubview(statusLabel)
    }
    
    func setupConstraints() {
        
        nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constant.padding8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -Constant.padding8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Constant.padding8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
        
        imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constant.padding6).isActive = true
        imageView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: Constant.padding8).isActive = true
        imageView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: -Constant.padding8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constant.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constant.heigthImage).isActive = true
        
        speciesLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constant.padding6).isActive = true
        speciesLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constant.padding16).isActive = true
        speciesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constant.padding16).isActive = true
        speciesLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
        
        genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: Constant.padding6).isActive = true
        genderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constant.padding16).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constant.padding16).isActive = true
        genderLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: Constant.padding6).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constant.padding16).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constant.padding16).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Constant.padding6).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constant.padding16).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constant.padding16).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
    }
    
    func additionalSettings() {
        backgroundColor = .black
        nameLabel.text = "Nome Personagem"
        nameLabel.textColor = .systemGreen
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Creepster-Regular", size: 24)
        speciesLabel.text = "Species: "
        genderLabel.text = "Gender: "
        typeLabel.text = "Type: "
        statusLabel.text = "Status: "
    }
}

// MARK: - Builders

extension DetailsView {
    
    private func buildLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Creepster-Regular", size: Constant.fontSize)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = Constant.radius
        return imageView
    }
}
