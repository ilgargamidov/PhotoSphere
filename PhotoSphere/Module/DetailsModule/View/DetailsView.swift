//
//  DetailsView.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 16.04.2024.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    
}

class DetailsView: UIViewController {
    
    var presenter: DetailsViewPresenterProtocol!
    private var menuViewHeight = UIApplication.topSafeArea + 50
    
    lazy var topMenuView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: menuViewHeight)
        $0.backgroundColor = .appMain
        return $0
    }(UIView())
    
    lazy var backAction = UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }
    
    lazy var menuAction = UIAction { [weak self] _ in
        print("menu open")
    }
    
    lazy var navigationHeader: NavigationHeader = {
        NavigationHeader(backAction: backAction, menuAction: menuAction, date: presenter.item.date)
    }()
    
    lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .none
        $0.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 100, right: 0)
        $0.dataSource = self
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: getCompositionLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appMain
        view.addSubview(collectionView)
        view.addSubview(topMenuView)
        setupPageHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupPageHeader() {
        let headerView = navigationHeader.getNavigationHeader(type: .back)
        headerView.frame.origin.y = UIApplication.topSafeArea
        view.addSubview(headerView)
    }
}
extension DetailsView{
    private func getCompositionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout{ [weak self] section, _ in
            switch section {
            default:
                return self?.createPhotoSection()
                
                
            }
        }
    }
    private func createPhotoSection() -> NSCollectionLayoutSection {
        //item(size)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30)
        
        //group(size)+item
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30)
        return section
        
    }
}
extension DetailsView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.item.photos.count
            //      case 1:
            //          return presenter.item.tags?.count ?? 0
            //      case 2,4,5:
            //         return 1
            //    case 3:
            //       return presenter.item.comments?.count ?? 0
        default:
            return 1
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
    extension DetailsView: DetailsViewProtocol {
        
    }
    

