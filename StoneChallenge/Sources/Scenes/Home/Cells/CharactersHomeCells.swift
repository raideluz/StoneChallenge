//
//  CharactersHomeCells.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 17/12/21.

import UIKit

// MARK: - Class

class CharactersHomeCells: UICollectionViewCell {
    
    struct Constant {
        static let padding16: CGFloat = 16
        static let padding6: CGFloat = 6
        static let width: CGFloat = 200
        static let heigthImage: CGFloat = 300
        static let heigthLabel: CGFloat = 40
        static let fontSize: CGFloat = 22
        static let radius: CGFloat = 6
    }
    
    struct Data {
        let image: UIImage
        let name: String
    }
    
    // MARK: - Properties
    
    private lazy var imageView = buildImageView()
    private lazy var nameLabel = buildLabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - ViewCode

extension CharactersHomeCells: ViewCode {
    
    func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        contentView.widthAnchor.constraint(equalToConstant: Constant.width).isActive = true
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.padding16).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constant.padding16).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constant.padding16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constant.heigthImage).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constant.padding6).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constant.padding16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constant.padding16).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.padding16).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constant.heigthLabel).isActive = true
    }
    
    func additionalSettings() {
        
    }
}

// MARK: - Builders

extension CharactersHomeCells {
    
    private func buildImageView() -> UIImageView {
            let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = Constant.radius
        return imageView
    }
    
    private func buildLabel() -> UILabel {
            let label = UILabel()
        label.text = "Personagem"
        label.textAlignment = .center
        label.font = UIFont(name: "Creepster-Regular", size: Constant.fontSize)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }
}
