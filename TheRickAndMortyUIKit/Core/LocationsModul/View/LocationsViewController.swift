//
//  LocationsViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

class LocationsViewController: UIViewController {
    
    lazy private var label: UILabel = {
       let label  = UILabel()
        label.text = "Locations"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
       
    }
}

//MARK: - layout
private extension LocationsViewController {
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
