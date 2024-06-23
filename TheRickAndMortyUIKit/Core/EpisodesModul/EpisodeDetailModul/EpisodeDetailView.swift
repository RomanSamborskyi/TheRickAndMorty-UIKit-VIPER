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
        label.text = "episode:"
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
}
