//
//  MainPostHeader.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 18.04.2024.
//

import UIKit

class MainPostHeader: UICollectionReusableView {
        static let reuseId = "MainPostHeader"
    
    lazy var headerLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        $0.frame = CGRect(x: 30, y: 0, width: frame.width, height: frame.height)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
    }
    func setHeaderText(header: String?) {
        headerLabel.text = header
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
