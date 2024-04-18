//
//  TabBarViewPresenter.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 12.04.2024.
//

import UIKit

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
    func buildTabBar()
  
}

class TabBarViewPresenter {
    
    weak var view: TabBarViewProtocol?
    required init(view: TabBarViewProtocol) {
        self.view = view
        self.buildTabBar()
    }
    
}

extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    
    func buildTabBar() {
        let mainScreen = Builder.createMainScreenController()
        let cameraScreen = Builder.createCameraScreenController()
        let favoriteScreen = Builder.createFavoriteScreenController()
        
        self.view?.setControllers(controllers: [mainScreen, cameraScreen, favoriteScreen])
    }
}
