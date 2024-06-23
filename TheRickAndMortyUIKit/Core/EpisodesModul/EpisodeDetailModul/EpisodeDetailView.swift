//
//  EpisodeDetailView.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit

class EpisodeDetailView: UIView {
    //MARK: - property
    lazy private var nameEpisodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var epLabel: UILabel = {
        let label = UILabel()
        label.text = "Episode:"
        return label
    }()
    
    lazy private var episodesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy private var airDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Air date:"
        return label
    }()
    lazy private var airDateDateLabel: UILabel = {
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
        label.text = "name:"
        return label
    }()
    lazy private var charactersLabel: UILabel = {
        let label = UILabel()
        label.text = "Characters:"
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
    
    func update(episode: Episode) {
        nameEpisodeLabel.text = episode.name
        episodesLabel.text = episode.episode
        airDateDateLabel.text = episode.airDate
        createdDateLabel.text = episode.created
    }
}
//MARK: - setup layout
private extension EpisodeDetailView {
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
        vstack.addSubview(epLabel)
        epLabel.translatesAutoresizingMaskIntoConstraints = false
        epLabel.font = .systemFont(ofSize: 15)
        epLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            epLabel.topAnchor.constraint(equalTo: vstack.topAnchor, constant: 15),
            epLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 15),
            epLabel.heightAnchor.constraint(equalToConstant: 20),
            epLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    func setupEpisodeNameLabel() {
        vstack.addSubview(episodesLabel)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            episodesLabel.centerYAnchor.constraint(equalTo: epLabel.centerYAnchor),
            episodesLabel.leadingAnchor.constraint(equalTo: epLabel.trailingAnchor, constant: 10)
        ])
    }
    func setupAirLabel() {
        vstack.addSubview(airDateLabel)
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.font = .systemFont(ofSize: 15)
        airDateLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            airDateLabel.topAnchor.constraint(equalTo: epLabel.topAnchor, constant: 45),
            airDateLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 15),
            airDateLabel.heightAnchor.constraint(equalToConstant: 20),
            airDateLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    func setupAirDateLabel() {
        vstack.addSubview(airDateDateLabel)
        airDateDateLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateDateLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            airDateDateLabel.centerYAnchor.constraint(equalTo: airDateLabel.centerYAnchor),
            airDateDateLabel.leadingAnchor.constraint(equalTo: airDateLabel.trailingAnchor, constant: 10)
        ])
    }
    func setupCreateLabel() {
        vstack.addSubview(createdLabel)
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        createdLabel.font = .systemFont(ofSize: 15)
        createdLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            createdLabel.topAnchor.constraint(equalTo: airDateLabel.topAnchor, constant: 45),
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
        self.addSubview(charactersLabel)
        charactersLabel.translatesAutoresizingMaskIntoConstraints = false
        charactersLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        NSLayoutConstraint.activate([
            charactersLabel.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 20),
            charactersLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.04),
            charactersLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.33),
            charactersLabel.centerXAnchor.constraint(equalTo: vstack.centerXAnchor)
        ])
    }
}
