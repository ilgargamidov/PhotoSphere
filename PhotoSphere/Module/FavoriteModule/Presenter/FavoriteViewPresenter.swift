//
//  FavoriteViewPresenter.swift
//  PhotoSphere
//
//  Created by mac on 15.04.2024.
//

import UIKit

protocol FavoriteViewPresenterProtocol: AnyObject{
    init(view: FavoriteViewProtocol)
    var post: [PostItem]? { get set }
    func getPosts()
}

class FavoriteViewPresenter: FavoriteViewPresenterProtocol{
    var post: [PostItem]?
    private weak var view: FavoriteViewProtocol?
    
    required init(view: FavoriteViewProtocol) {
        self.view = view
        getPosts()
    }
    
    func getPosts() {
        self.post = PostItem.getMockItems()
        self.view?.showPost()
    }
}

