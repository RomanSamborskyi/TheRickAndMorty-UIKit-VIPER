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
    
    let separatorView = UIView.init(frame: CGRect(x: 5, y: UIScreen.main.bounds.height - 1, width: UIScreen.main.bounds.width - 5, height: 1))
    
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
        setupSeparator()
        setupEpLabel()
        setupEpisodesLabel()
    }
    func setupSeparator() {
        self.contentView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 5),
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
            nameLabel.widthAnchor.constraint(equalToConstant: 55),
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
            epLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            epLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            epLabel.widthAnchor.constraint(equalToConstant: 55),
            epLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
      
    }
    func setupEpisodesLabel() {
        self.contentView.addSubview(episodesLabel)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .systemFont(ofSize: 15)
        
        NSLayoutConstraint.activate([
            episodesLabel.leadingAnchor.constraint(equalTo: epLabel.trailingAnchor, constant: 10),
            episodesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            episodesLabel.centerYAnchor.constraint(equalTo: epLabel.centerYAnchor)
        ])
    }
}
