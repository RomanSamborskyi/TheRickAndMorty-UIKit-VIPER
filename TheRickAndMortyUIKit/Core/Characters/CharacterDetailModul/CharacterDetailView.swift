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
    
    lazy private var statLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var createLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var genLabel: UILabel = {
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
    
    lazy private var specLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy private var typeStringLabel: UILabel = {
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
        speciesLabel.text = character.species
        genderLabel.text = character.gender
        
        switch character.status {
        case "Dead":
            statusLabel.text = character.status + " " + "🔴"
        case "Alive":
            statusLabel.text = character.status + " " + "🟢"
            
        default:
            statusLabel.text = character.status
        }
    }
}

//MARK: - UI layout
private extension CharacterDetailView {
    func setupLayout() {
        self.backgroundColor = .systemBackground
        setupImageView()
        setupNameLabel()
        setupGenderLabel()
        setupStatusLabel()
        setupSpeciesLabel()
        setupTypeLabel()
    }
    
    func setupImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
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
        nameLabel.font = .systemFont(ofSize: 35, weight: .bold)
        nameLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    func setupStatusLabel() {
        self.addSubview(statusLabel)
        self.addSubview(statLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 20, weight: .bold)
        statusLabel.textAlignment = .center
        statusLabel.layer.borderColor = UIColor.adaptiveColor().cgColor
        statusLabel.layer.borderWidth = 3
        statusLabel.layer.cornerRadius = 15
        
        statLabel.translatesAutoresizingMaskIntoConstraints = false
        statLabel.font = .systemFont(ofSize: 15)
        statLabel.textAlignment = .center
        statLabel.textColor = .lightGray
        statLabel.text = "status"
        
        
        NSLayoutConstraint.activate([
            statLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            statLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5),
            statLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            statLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.025),
            
            statusLabel.topAnchor.constraint(equalTo: statLabel.bottomAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            statusLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            statusLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065),
        ])
    }
    func setupGenderLabel() {
        self.addSubview(genderLabel)
        self.addSubview(genLabel)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.font = .systemFont(ofSize: 20, weight: .bold)
        genderLabel.textAlignment = .center
        genderLabel.layer.borderColor = UIColor.adaptiveColor().cgColor
        genderLabel.layer.borderWidth = 3
        genderLabel.layer.cornerRadius = 15
        
        genLabel.translatesAutoresizingMaskIntoConstraints = false
        genLabel.font = .systemFont(ofSize: 15)
        genLabel.textAlignment = .center
        genLabel.textColor = .lightGray
        genLabel.text = "gender"
        
        
        NSLayoutConstraint.activate([
            genLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            genLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            genLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            genLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.025),
            
            genderLabel.topAnchor.constraint(equalTo: genLabel.bottomAnchor, constant: 5),
            genderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            genderLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            genderLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065),
        ])
    }
    func setupSpeciesLabel() {
        self.addSubview(speciesLabel)
        self.addSubview(specLabel)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.font = .systemFont(ofSize: 20, weight: .bold)
        speciesLabel.textAlignment = .center
        speciesLabel.layer.borderColor = UIColor.adaptiveColor().cgColor
        speciesLabel.layer.borderWidth = 3
        speciesLabel.layer.cornerRadius = 15
        
        specLabel.translatesAutoresizingMaskIntoConstraints = false
        specLabel.font = .systemFont(ofSize: 15)
        specLabel.textAlignment = .center
        specLabel.textColor = .lightGray
        specLabel.text = "species"
        
        
        NSLayoutConstraint.activate([
            specLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            specLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            specLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            specLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.025),
            
            speciesLabel.topAnchor.constraint(equalTo: specLabel.bottomAnchor, constant: 5),
            speciesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            speciesLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            speciesLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065),
        ])
    }
    func setupTypeLabel() {
        self.addSubview(typeLabel)
        self.addSubview(typeStringLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        typeLabel.textAlignment = .center
        typeLabel.layer.borderColor = UIColor.adaptiveColor().cgColor
        typeLabel.layer.borderWidth = 3
        typeLabel.layer.cornerRadius = 15
        
        typeStringLabel.translatesAutoresizingMaskIntoConstraints = false
        typeStringLabel.font = .systemFont(ofSize: 15)
        typeStringLabel.textAlignment = .center
        typeStringLabel.textColor = .lightGray
        typeStringLabel.text = "type"
        
        
        NSLayoutConstraint.activate([
            typeStringLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            typeStringLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5),
            typeStringLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            typeStringLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.025),
            
            typeLabel.topAnchor.constraint(equalTo: typeStringLabel.bottomAnchor, constant: 5),
            typeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            typeLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.3),
            typeLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065),
        ])
    }
}
