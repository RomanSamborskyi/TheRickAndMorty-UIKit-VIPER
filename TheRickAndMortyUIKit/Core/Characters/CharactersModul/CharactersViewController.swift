//
//  ViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {
    func showCharacters(characters: [Character])
    func showCharacterImage(image: [Int: UIImage])
}

class CharactersViewController: UIViewController {
    
    var presenter: CharactersPresnterProtocol? 
    private(set) var characters: [Character] = []
    private(set) var posters: [Int: UIImage] = [:]
    
    lazy private var charactersCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.height / 2.9)
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.identifier)
        return cell
    }()
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        presenter?.viewContorllerDidLoad()
        loadLayout()
    }
}

//MARK: - layout
private extension CharactersViewController {
    func loadLayout() {
        self.setupCollectionViewCell()
    }
    func setupCollectionViewCell() {
        view.addSubview(charactersCell)
        charactersCell.delegate = self
        charactersCell.dataSource = self
        charactersCell.backgroundColor = .systemBackground
        charactersCell.tag = 0
        
        NSLayoutConstraint.activate([
            charactersCell.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            charactersCell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            charactersCell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: UIScreen.main.bounds.height * 0.0004),
        ])
    }
}
//MARK: - protocol conformation
extension CharactersViewController: CharactersViewProtocol {
    func showCharacterImage(image: [Int : UIImage]) {
        DispatchQueue.main.async {
            self.posters = image
            self.charactersCell.reloadData()
        }
    }
    func showCharacters(characters: [Character]) {
        DispatchQueue.main.async {
            self.characters = characters
            self.charactersCell.reloadData()
        }
    }
}
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
            cell.character = self.characters[indexPath.row]
            let char = self.characters[indexPath.row]
            cell.poster = posters[char.id]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        guard let poster = posters[character.id] else { return }
        presenter?.didDetailButtonTapped(for: character, image: poster)
    }
}
