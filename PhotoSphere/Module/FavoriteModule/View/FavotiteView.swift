//
//  FavoriteView.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 11.04.2024.
//

import UIKit

protocol FavoriteViewProtocol: AnyObject {
    func showPosts()
}

class FavotiteView: UIViewController {
    
    var presenter: FavoriteViewPresenterProtocol!

    lazy var collectionView: UICollectionView = {
        let itemSize = (view.bounds.width - 60) / 2 - 15
        
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumLineSpacing = 30
        //layout.minimumInteritemSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 50, left: 30, bottom: 80, right: 30)
        
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        $0.alwaysBounceVertical = true
        $0.backgroundColor = .appMain
        $0.register(FavoriteCell.self, forCellWithReuseIdentifier: FavoriteCell.reuseId)
        
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appMain
        view.addSubview(collectionView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
        NotificationCenter.default.post(name: .hideTabBar, object: nil, userInfo: ["isHide": false])
    }
    
    private func setupNavBar() {
        title = "Избранное"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .appMain
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }

}

extension FavotiteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.post?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.reuseId, for: indexPath) as! FavoriteCell
        
        if let item = presenter.post?[indexPath.item] {
            cell.configureCell(item: item)
        }
        return cell
    }
}

extension FavotiteView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = presenter.post?[indexPath.item] else { return }
        
        let detailsView = Builder.createDetailsController(item: item)
        navigationController?.pushViewController(detailsView, animated: true)
    }
}


extension FavotiteView: FavoriteViewProtocol {
    func showPosts() {
        collectionView.reloadData()
    }
}

