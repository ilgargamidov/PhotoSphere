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
        mainView.presenter = presenter
        return mainView
    }
    
    static func createCameraScreenController() -> UIViewController {
        let cameraView = CameraView()
        let cameraService = CameraService()
        let presenter = CameraViewPresenter(view: cameraView, cameraService: cameraService)
        
        cameraView.presenter = presenter
        return UIImagePickerController(rootViewController: cameraView)
    }
    
    static func createFavoriteScreenController() -> UIViewController {
        let favoriteView = FavotiteView()
        let presenter = FavoriteViewPresenter(view: favoriteView)
        
        favoriteView.presenter = presenter
        return UINavigationController(rootViewController: favoriteView)
    }
    
    static func createDetailsController(item: PostItem) -> UIViewController {
        let detailsView = DetailsView()
        let presenter = DetailsViewPresenter(view: detailsView, item: item)
        
        detailsView.presenter = presenter
        
        
        return detailsView
    }
   
    static func createPhotoViewController(image: UIImage?) -> UIViewController {
        let photoView = PhotoView()
        let presenter = PhotoViewPresenter(view: photoView, image: image)
        
        photoView.presenter = presenter
        return photoView
    }
    
}
