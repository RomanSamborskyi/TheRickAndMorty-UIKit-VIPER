//
//  CharacterDetailViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 22.06.2024.
//

import UIKit

protocol CharacterDetailViewProtocol: AnyObject {
    func showCharacter(character: Character, withImage: UIImage)
}

class CharacterDetailViewController: UIViewController {
    
    private(set) var episodes: [Episode] = []
    var presenter: CharacterDetailPresenterProtocol?
    lazy private var details = CharacterDetailView()
    lazy private var scrlView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy private var collectionCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 8)
        layout.scrollDirection = .horizontal
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(EpisodesViewCell.self, forCellWithReuseIdentifier: EpisodesViewCell.identifier)
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        presenter?.viewControllerDidLoad()
    }
}

//MARK: - protocol conformation
extension CharacterDetailViewController: CharacterDetailViewProtocol {
    func showCharacter(character: Character, withImage: UIImage) {
        DispatchQueue.main.async {
            self.details.updateUI(for: character, with: withImage)
            self.view.layoutIfNeeded()
            self.collectionCell.reloadData()
        }
    }
}
private extension CharacterDetailViewController {
    func setupLayout() {
        view.backgroundColor = .systemBackground
        setupScrollView()
    }
    
    func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrlView)
        scrlView.addSubview(details)
        scrlView.addSubview(collectionCell)
        
        scrlView.translatesAutoresizingMaskIntoConstraints = false
        details.translatesAutoresizingMaskIntoConstraints = false
        
        collectionCell.translatesAutoresizingMaskIntoConstraints = false
        collectionCell.dataSource = self
        collectionCell.delegate = self
        
        NSLayoutConstraint.activate([
            scrlView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrlView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrlView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrlView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            details.topAnchor.constraint(equalTo: scrlView.topAnchor),
            details.leadingAnchor.constraint(equalTo: scrlView.leadingAnchor),
            details.trailingAnchor.constraint(equalTo: scrlView.trailingAnchor),
            details.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            details.widthAnchor.constraint(equalTo: scrlView.widthAnchor),
            
            
            
            collectionCell.topAnchor.constraint(equalTo: details.bottomAnchor, constant: UIScreen.main.bounds.height / 9.5),
            collectionCell.leadingAnchor.constraint(equalTo: scrlView.leadingAnchor, constant: 5),
            collectionCell.trailingAnchor.constraint(equalTo: scrlView.trailingAnchor, constant: -5),
            collectionCell.bottomAnchor.constraint(equalTo: scrlView.bottomAnchor),
            collectionCell.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 8)
        ])
    }
}
extension CharacterDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesViewCell.identifier, for: indexPath) as! EpisodesViewCell
        return cell
    }
}
