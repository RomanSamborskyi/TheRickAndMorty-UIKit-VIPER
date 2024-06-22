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
    lazy private var details = CharacterDetailView()
    lazy private var scrlView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
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
        }
    }
}
private extension CharacterDetailViewController {
    func setupLayout() {
        setupScrollView()
        setupDetailView()
    }
    func setupDetailView() {
        view.addSubview(details)
        details.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalTo: self.view.topAnchor),
            details.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            details.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            details.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    func setupScrollView() {
        view.addSubview(scrlView)
        scrlView.addSubview(details)
        scrlView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrlView.topAnchor.constraint(equalTo: view.topAnchor),
            scrlView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrlView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrlView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
