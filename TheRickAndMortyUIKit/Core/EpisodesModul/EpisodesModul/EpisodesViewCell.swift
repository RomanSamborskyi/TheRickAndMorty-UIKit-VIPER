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
      //  setupEpLabel()
       // setupNameLabel()
        setupEpisodeNameLabel()
       // setupEpisodesLabel()
        
    }
    func setupNameLabel() {
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 10)
        nameLabel.textColor = .lightGray
        
    }
    func setupEpisodeNameLabel() {
        self.contentView.addSubview(nameEpisodeLabel)
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameEpisodeLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        NSLayoutConstraint.activate([
            nameEpisodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameEpisodeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    func setupEpLabel() {
        self.contentView.addSubview(epLabel)
        epLabel.translatesAutoresizingMaskIntoConstraints = false
        epLabel.font = .systemFont(ofSize: 10)
        epLabel.textColor = .lightGray
        
      
    }
    func setupEpisodesLabel() {
        self.contentView.addSubview(episodesLabel)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
     
    }
}
