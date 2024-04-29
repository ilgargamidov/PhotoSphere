//
//  SettingsViewPresenter.swift
//  PhotoSphere
//
//  Created by mac on 29.04.2024.
//


import UIKit

protocol SettingsViewPresenterProtocol: AnyObject {
    init (view: SettingsViewProtocol)
}

class SettingsViewPresenter: SettingsViewPresenterProtocol {
    private weak var view: SettingsViewProtocol?
    
    required  init(view: SettingsViewProtocol) {
        self.view = view
    }
}


