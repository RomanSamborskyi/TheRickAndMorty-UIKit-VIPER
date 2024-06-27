//
//  LocationsCollectionViewCell.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "LocationsCollectionViewCell"
    
    var location: SingleLocation? {
        didSet {
            guard let episode = location else { return }
            nameLocationLabel.text = episode.name
            dimensionNameLablel.text = episode.dimension
        }
    }
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name:"
        return label
    }()
    
    lazy private var nameLocationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var dimensionLabel: UILabel = {
        let label = UILabel()
        label.text = "dimension:"
        return label
    }()
    
    lazy private var dimensionNameLablel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let separatorView = UIView.init(frame: CGRect(x: 5, y: UIScreen.main.bounds.height - 1, width: UIScreen.main.bounds.width - 5, height: 1))
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderColor = UIColor.adaptiveColor().cgColor
        contentView.layer.borderWidth = 3
        contentView.layer.cornerRadius = 20
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal errror LocationsCollectionViewCell")
    }
}
//MARK: - setup layout
private extension LocationsCollectionViewCell {
    
    func setupLayout() {
        setupNameLabel()
        setupEpisodeNameLabel()
        setupSeparator()
        setupEpLabel()
        setupEpisodesLabel()
    }
    func setupSeparator() {
        self.contentView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: nameLocationLabel.bottomAnchor, constant: 5),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    func setupNameLabel() {
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 13)
        nameLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
        
    }
    func setupEpisodeNameLabel() {
        self.contentView.addSubview(nameLocationLabel)
        nameLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLocationLabel.font = .systemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            nameLocationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLocationLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameLocationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLocationLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
    }
    func setupEpLabel() {
        self.contentView.addSubview(dimensionLabel)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionLabel.font = .systemFont(ofSize: 13)
        dimensionLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            dimensionLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            dimensionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            dimensionLabel.widthAnchor.constraint(equalToConstant: 70),
            dimensionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
      
    }
    func setupEpisodesLabel() {
        self.contentView.addSubview(dimensionNameLablel)
        dimensionNameLablel.translatesAutoresizingMaskIntoConstraints = false
        dimensionNameLablel.font = .systemFont(ofSize: 15)
        
        NSLayoutConstraint.activate([
            dimensionNameLablel.leadingAnchor.constraint(equalTo: dimensionLabel.trailingAnchor, constant: 10),
            dimensionNameLablel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dimensionNameLablel.centerYAnchor.constraint(equalTo: dimensionLabel.centerYAnchor)
        ])
    }
}

