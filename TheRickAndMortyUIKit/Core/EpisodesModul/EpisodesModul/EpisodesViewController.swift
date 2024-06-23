//
//  EpisodesViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol EpisodesViewProtocol: AnyObject {
    func show(episodes: [Episode])
}

class EpisodesViewController: UIViewController {
    
    var presenter: EpisodesPresenterProtocol?
    private(set) var episdes: [Episode] = []
    
    lazy private var collectionCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 8)
        layout.scrollDirection = .vertical
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(EpisodesViewCell.self, forCellWithReuseIdentifier: EpisodesViewCell.identifier)
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Episodes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        presenter?.viewControllerDidLoad()
        setupLayout()
    }
}

//MARK: - layout
private extension EpisodesViewController {
    func setupLayout() {
        self.setupCollectionViewCell()
    }
    func setupCollectionViewCell() {
        view.addSubview(collectionCell)
        collectionCell.translatesAutoresizingMaskIntoConstraints = false
        collectionCell.delegate = self
        collectionCell.dataSource = self
        
        
        NSLayoutConstraint.activate([
            collectionCell.topAnchor.constraint(equalTo: view.topAnchor),
            collectionCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionCell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionCell.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
extension EpisodesViewController: EpisodesViewProtocol {
    func show(episodes: [Episode]) {
        DispatchQueue.main.async {
            self.episdes = episodes
            self.collectionCell.reloadData()
        }
    }
}
extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episdes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesViewCell.identifier, for: indexPath) as! EpisodesViewCell
        cell.episode = self.episdes[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let episode = episdes[indexPath.row]
         presenter?.episodeDidSelected(episode: episode)
    }
}
