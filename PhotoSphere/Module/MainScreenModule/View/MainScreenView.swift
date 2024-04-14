//
//  MainScreenView.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 12.04.2024.
//

import UIKit

protocol MainScreenViewProtocol: AnyObject {
    func showPosts()
}

class MainScreenView: UIViewController {
    
    var presenter: MainScreenViewProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension MainScreenView: MainScreenViewProtocol {
    func showPosts() {
        return
    }
    
    
}

