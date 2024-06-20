//
//  ViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {
    
}

class CharactersViewController: UIViewController {
    
    var presenter: CharactersPresnterProtocol? 
    
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
        
    }
}
//MARK: - protocol conformation
extension CharactersViewController: CharactersViewProtocol {
    
}
