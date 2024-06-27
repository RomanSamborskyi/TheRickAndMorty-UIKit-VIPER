//
//  LocatioDetailView.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 27.06.2024.
//

import UIKit

class LocatioDetailView: UIView {
    //MARK: - property
    lazy private var nameEpisodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var dimensionLabel: UILabel = {
        let label = UILabel()
        label.text = "Dimension:"
        return label
    }()
    
    lazy private var dimensionNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy private var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        return label
    }()
    lazy private var typeNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy private var createdLabel: UILabel = {
        let label = UILabel()
        label.text = "Created:"
        return label
    }()
    lazy private var createdDateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy private var residentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Residents:"
        return label
    }()
    lazy private var vstack: UIStackView = {
        let view = UIStackView()
        return view
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal error from EpisodeDetailView")
    }
    
    func update(location: SingleLocation) {
        nameEpisodeLabel.text = location.name
        dimensionNameLabel.text = location.dimension
        typeNameLabel.text = location.type
        createdDateLabel.text = location.created
    }
}
//MARK: - setup layout
private extension LocatioDetailView {
    func setupLayout() {
        setupNameLabel()
        setupStack()
        setupEpLabel()
        setupEpisodeNameLabel()
        setupAirLabel()
        setupAirDateLabel()
        setupCreateLabel()
        setupCreateDateLabel()
        setupCharactersHeaderLabel()
    }
    func setupNameLabel() {
        self.addSubview(nameEpisodeLabel)
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameEpisodeLabel.font = .systemFont(ofSize: 35, weight: .bold)
        nameEpisodeLabel.textAlignment = .center
        nameEpisodeLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            nameEpisodeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height * 0.0002),
            nameEpisodeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameEpisodeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameEpisodeLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.2)
        ])
    }
    func setupStack() {
        self.addSubview(vstack)
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.layer.borderColor = UIColor.adaptiveColor().cgColor
        vstack.layer.borderWidth = 2
        vstack.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            vstack.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 20),
            vstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            vstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            vstack.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
        ])
    }
    func setupEpLabel() {
        vstack.addSubview(dimensionLabel)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionLabel.font = .systemFont(ofSize: 15)
        dimensionLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            dimensionLabel.topAnchor.constraint(equalTo: vstack.topAnchor, constant: 15),
            dimensionLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 15),
            dimensionLabel.heightAnchor.constraint(equalToConstant: 20),
            dimensionLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    func setupEpisodeNameLabel() {
        vstack.addSubview(dimensionNameLabel)
        dimensionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionNameLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            dimensionNameLabel.centerYAnchor.constraint(equalTo: dimensionLabel.centerYAnchor),
            dimensionNameLabel.leadingAnchor.constraint(equalTo: dimensionLabel.trailingAnchor, constant: 10)
        ])
    }
    func setupAirLabel() {
        vstack.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .systemFont(ofSize: 15)
        typeLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: dimensionLabel.topAnchor, constant: 45),
            typeLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 15),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            typeLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    func setupAirDateLabel() {
        vstack.addSubview(typeNameLabel)
        typeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeNameLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            typeNameLabel.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            typeNameLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 10)
        ])
    }
    func setupCreateLabel() {
        vstack.addSubview(createdLabel)
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        createdLabel.font = .systemFont(ofSize: 15)
        createdLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            createdLabel.topAnchor.constraint(equalTo: typeLabel.topAnchor, constant: 45),
            createdLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 15),
            createdLabel.heightAnchor.constraint(equalToConstant: 20),
            createdLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    func setupCreateDateLabel() {
        vstack.addSubview(createdDateLabel)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            createdDateLabel.centerYAnchor.constraint(equalTo: createdLabel.centerYAnchor),
            createdDateLabel.leadingAnchor.constraint(equalTo: createdLabel.trailingAnchor, constant: 10)
        ])
    }
    func setupCharactersHeaderLabel() {
        self.addSubview(residentsLabel)
        residentsLabel.translatesAutoresizingMaskIntoConstraints = false
        residentsLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        NSLayoutConstraint.activate([
            residentsLabel.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 20),
            residentsLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.04),
            residentsLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.33),
            residentsLabel.centerXAnchor.constraint(equalTo: vstack.centerXAnchor)
        ])
    }
}

