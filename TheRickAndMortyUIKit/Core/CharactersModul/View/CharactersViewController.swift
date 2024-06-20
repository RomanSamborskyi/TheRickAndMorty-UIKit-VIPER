//
//  ViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {
    func showCharacters(characters: [Character])
}

class CharactersViewController: UIViewController {
    
    var presenter: CharactersPresnterProtocol? 
    private(set) var characters: [Character] = []
    
    lazy private var charactersCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 180, height: 270)
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.identifier)
        return cell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewContorllerDidLoad()
        loadLayout()
    }
}

//MARK: - layout
private extension CharactersViewController {
    func loadLayout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupCollectionViewCell()
        }
    }
    func setupCollectionViewCell() {
        view.addSubview(charactersCell)
        charactersCell.delegate = self
        charactersCell.dataSource = self
        charactersCell.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            charactersCell.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            charactersCell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            charactersCell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
        ])
    }
}
//MARK: - protocol conformation
extension CharactersViewController: CharactersViewProtocol {
    func showCharacters(characters: [Character]) {
        DispatchQueue.main.async {
            self.characters = characters
            self.view.layoutIfNeeded()
        }
    }
}
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charactersCell.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
            cell.character = self.characters[indexPath.row]
        return cell
    }
}
