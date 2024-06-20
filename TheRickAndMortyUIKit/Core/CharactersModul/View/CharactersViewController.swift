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
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Name of the first one"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewContorllerDidLoad()
        view.backgroundColor = .systemBackground
        loadLayout()
    }
}

//MARK: - layout
private extension CharactersViewController {
    func loadLayout() {
        setupLabel()
    }
    func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
//MARK: - protocol conformation
extension CharactersViewController: CharactersViewProtocol {
    func showCharacters(characters: [Character]) {
        DispatchQueue.main.async {
            self.label.text = characters.first?.name
        }
    }
}
