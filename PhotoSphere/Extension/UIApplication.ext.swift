//
//  UIApplication.ext.swift
//  PhotoSphere
//
//  Created by mac on 15.04.2024.
//

import UIKit

extension UIApplication {
    static var topSafeArea: CGFloat {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets.top ?? .zero
    }
}
