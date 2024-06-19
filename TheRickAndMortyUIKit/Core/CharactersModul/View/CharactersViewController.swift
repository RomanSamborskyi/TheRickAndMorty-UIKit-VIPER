//
//  ViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

class CharactersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
    }
}

//MARK: - layout
private extension CharactersViewController {
    func loadLayout() {
        view.backgroundColor = .red
    }
}

