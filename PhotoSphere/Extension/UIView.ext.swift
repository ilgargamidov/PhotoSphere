//
//  UIView.ext.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 10.04.2024.
//

import UIKit

extension UIView {
    static func configure<T: UIView>(view: T, block: @escaping (T) -> ()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}
