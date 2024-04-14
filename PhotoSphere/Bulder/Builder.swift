//
//  Builder.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 10.04.2024.
//

import UIKit

protocol BuilderProtocol{
    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController
    static func createTabBarController() -> UIViewController
    
    static func createMainScreenController() -> UIViewController
    static func createCameraScreenController() -> UIViewController
    static func createFavoriteScreenController() -> UIViewController
}

class Builder: BuilderProtocol {
      
    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController{
        let passcodeView = PasscodeView()
        let keychainManager = KeychainManager()
        
        let presenter = PasscodePresenter(view: passcodeView, passcodeState: passcodeState, keychainManager: keychainManager, sceneDelegate: sceneDelegate)
        
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarView()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        
        return tabBarView
    }
    
    static func createMainScreenController() -> UIViewController {
        let mainView = MainScreenView()
        let presenter = MainScreenPresenter(view: mainView)
        mainView.presenter = presenter as? any MainScreenViewProtocol
        return mainView
    }
    
    static func createCameraScreenController() -> UIViewController {
        let cameraView = CameraView()
        
        return cameraView
    }
    
    static func createFavoriteScreenController() -> UIViewController {
        let favoriteView = FavotiteView()
        
        return favoriteView
    }
    
   
}
