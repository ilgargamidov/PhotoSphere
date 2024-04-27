//
//  AddPostPresenter.swift
//  PhotoSphere
//
//  Created by mac on 27.04.2024.
//
import UIKit

protocol AddPostPresenterProtocol:AnyObject{
    init(view:AddPostViewProtocol, photos: [UIImage])
   
    var photos: [UIImage] {get set}
    var tags: [String] {get set}
    
}

class AddPostPresenter: AddPostPresenterProtocol{
    private weak var view:AddPostViewProtocol?
    var photos: [UIImage]
    var tags: [String] = ["Природа", "Work", "Education"]
   
    required init(view: any AddPostViewProtocol, photos: [UIImage]) {
        self.photos = photos
        self.view = view
    }
    
}

