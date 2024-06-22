//
//  EpisodesViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol EpisodesViewProtocol: AnyObject {
    
}

class EpisodesViewController: UIViewController {
    
    var presenter: EpisodesPresenterProtocol?
    
    lazy private var label: UILabel = {
       let label  = UILabel()
        label.text = "Episodes"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewControllerDidLoad()
        setupLayout()
    }
}

//MARK: - layout
private extension EpisodesViewController {
    func setupLayout() {
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
extension EpisodesViewController: EpisodesViewProtocol {
    
}
