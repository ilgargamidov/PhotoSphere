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

class TabBarViewPresenter: TabBarViewPresenterProtocol {
    weak var view: TabBarViewProtocol?
    required init(view: TabBarViewProtocol) {
        self.view = view
        self.buildTabBar()
    }
    
    func buildTabBar() {
        self.view?.setControllers(controllers: [])
    }
    
}

// Было как ниже, но в итоге удалил расширение и вернул функцию обратно в класс:
// extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    
//    func buildTabBar() {
//        self.view?.setControllers(controllers: [])
//    }
// }
