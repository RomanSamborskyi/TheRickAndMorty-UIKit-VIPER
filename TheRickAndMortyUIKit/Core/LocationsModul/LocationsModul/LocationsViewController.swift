//
//  LocationsViewController.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 19.06.2024.
//

import UIKit

protocol LocationViewProtocol: AnyObject {
    func show(locations: [SingleLocation])
}

class LocationsViewController: UIViewController {
    
    private(set) var locations: [SingleLocation] = []
    lazy private var collectionCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 8)
        layout.scrollDirection = .vertical
        let cell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cell.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    lazy private var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    var presenter: LocationsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewControllerDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Locations"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupLayout()
       
    }
}

//MARK: - layout
private extension LocationsViewController {
    func setupLayout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupScrollView()
            self.setupCollectionView()
        }
    }
    func setupScrollView() {
        let margins = view.layoutMarginsGuide
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
        ])
    }
    func setupCollectionView() {
        self.scrollView.addSubview(collectionCell)
        collectionCell.translatesAutoresizingMaskIntoConstraints = false
        collectionCell.delegate = self
        collectionCell.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionCell.topAnchor.constraint(equalTo: scrollView.topAnchor),
            collectionCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionCell.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionCell.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}
extension LocationsViewController: LocationViewProtocol {
    func show(locations: [SingleLocation]) {
        DispatchQueue.main.async {
            self.locations.append(contentsOf: locations)
        }
    }
}
extension LocationsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        locations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as! LocationsCollectionViewCell
        cell.location = self.locations[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.locations[indexPath.row]
    }
}
