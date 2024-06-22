//
//  EpisodesViewCollectionViewCell.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit

class EpisodesViewCell: UICollectionViewCell {
    
    static var identifier: String = "EpisodesViewCollectionViewCell"
    
    var episode: Episode? {
        didSet {
            guard let episode = episode else { return }
            nameEpisodeLabel.text = episode.name
            episodesLabel.text = episode.episode
        }
    }
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name:"
        return label
    }()
    
    lazy private var nameEpisodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var epLabel: UILabel = {
        let label = UILabel()
        label.text = "episode:"
        return label
    }()
    
    lazy private var episodesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderWidth = 3
        contentView.layer.cornerRadius = 20
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal errror EpisodesViewCollectionViewCell")
    }
}
//MARK: - setup layout
private extension EpisodesViewCell {
    
    func setupLayout() {
        setupNameLabel()
        setupEpisodeNameLabel()
        setupEpLabel()
        setupEpisodesLabel()
    }
    func setupNameLabel() {
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 13)
        nameLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            nameLabel.widthAnchor.constraint(equalToConstant: 55),
           // nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    func setupEpisodeNameLabel() {
        self.contentView.addSubview(nameEpisodeLabel)
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameEpisodeLabel.font = .systemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            nameEpisodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameEpisodeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
    }
    func setupEpLabel() {
        self.contentView.addSubview(epLabel)
        epLabel.translatesAutoresizingMaskIntoConstraints = false
        epLabel.font = .systemFont(ofSize: 13)
        epLabel.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            epLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            epLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            epLabel.widthAnchor.constraint(equalToConstant: 55),
            epLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
        ])
      
    }
    func setupEpisodesLabel() {
        self.contentView.addSubview(episodesLabel)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
           // episodesLabel.topAnchor.constraint(equalTo: nameEpisodeLabel.topAnchor, constant: 5),
            episodesLabel.leadingAnchor.constraint(equalTo: epLabel.trailingAnchor, constant: 10),
            episodesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            episodesLabel.centerYAnchor.constraint(equalTo: epLabel.centerYAnchor)
        ])
    }
}
