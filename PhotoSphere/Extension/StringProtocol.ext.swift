//
//  StringProtocol.ext.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 11.04.2024.
//

import UIKit

extension StringProtocol {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}
