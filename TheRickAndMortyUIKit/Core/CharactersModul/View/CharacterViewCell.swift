//
//  CharacterViewCell.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 20.06.2024.
//

import UIKit

class CharacterViewCell: UICollectionViewCell {
    static let identifier = "CharacterViewCell"
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            nameLabel.text = character.name
            statusLabel.text = character.status
        }
    }
    
    var poster: UIImage? {
        didSet {
            guard let image = poster  else { return }
            imageView.image = image
        }
    }
    
    lazy private var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy private var nameLabel: UILabel = {
        let name = UILabel()
        
        return name
    }()
    
    lazy private var statusLabel: UILabel = {
        let status = UILabel()
        
        return status
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray
        contentView.layer.cornerRadius = 15
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatall erro of init CharacterViewCell")
    }
}

private extension CharacterViewCell {
    func setupLayout() {
        setupImageView()
        setupNameLabel()
        setupStatusLabel()
    }
    func setupImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupStatusLabel() {
        contentView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
