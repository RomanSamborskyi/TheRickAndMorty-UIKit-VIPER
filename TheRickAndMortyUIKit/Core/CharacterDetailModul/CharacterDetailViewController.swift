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
    
    var presenter: CharacterDetailPresenterProtocol?
    lazy var details = CharacterDetailView()

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
        }
    }
}
private extension CharacterDetailViewController {
    func setupLayout() {
        view.addSubview(details)
        details.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalTo: self.view.topAnchor),
            details.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            details.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            details.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
