//
//  CharacterDetailView.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit

class CharacterDetailView: UIView {

    //MARK: - property
    lazy private var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var statusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var createLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var genderLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var speciesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("Fatal error from CharacterDetailView")
    }
    
    func updateUI(for character: Character, with image: UIImage) {
        imageView.image = image
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        genderLabel.text = character.gender
    }
}

//MARK: - UI layout
private extension CharacterDetailView {
    func setupLayout() {
        self.backgroundColor = .systemBackground
        setupImageView()
        setupNameLabel()
    }
    
    func setupImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
       // imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2)
        ])
    }
    func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 40, weight: .bold)
        nameLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
