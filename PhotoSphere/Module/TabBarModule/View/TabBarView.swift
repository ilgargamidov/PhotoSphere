//
//  TabBarView.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 12.04.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class TabBarView: UITabBarController {
    
    var presenter: TabBarViewPresenterProtocol!
    private let tabs: [UIImage] = [.home, .plus, .heart]
    
    private lazy var tabBarView: UIView = {
        return $0
    }(UIView(frame: CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 60)))


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabs.enumerated().forEach{
            let offsets: [Double] = [-100, 0, 100]
            let tabButton = createTabBarButton(icon: $0.element, tag: $0.offset, offsetX: offsets[$0.offset], isBigButton: $0.offset == 1 ? true : false)
            
            tabBar.addSubview(tabButton)
        }
        view.addSubview(tabBarView)
    }
    @objc func gotToMainView(){
        self.selectedIndex = 0
    }
    
    @objc func hideTabBar(sender: Notification) {
        let isHide = sender.userInfo?["isHide"] as! Bool
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            if isHide {
                self.tabBarView.frame.origin.y = self.view.frame.height
            } else {
                self.tabBarView.frame.origin.y = view.frame.height - 100
            }
        }
       
    }
    override func viewDidAppear(_ animated: Bool) {
        selectedIndex = 2
    }
    
   
    lazy var selecteItem = UIAction { [weak self] sender in
        guard
            let self = self,
            let sender = sender.sender as? UIButton
        else { return }
        
        self.selectedIndex = sender.tag
    }
}
extension TabBarView{
    
    private func createTabBarButton(icon: UIImage, tag: Int, offsetX: Double, isBigButton: Bool = false) -> UIButton{
        return {
            let btnSize: Double = isBigButton ? 60 : 25
            let yOffset = isBigButton ? 0 : 15
            
            $0.frame.size = CGSize(width: btnSize, height: btnSize)
            $0.tag = tag
            $0.setBackgroundImage(icon, for: .normal)
            $0.tintColor = .white
            $0.frame.origin = CGPoint(x: .zero, y: yOffset)
            $0.center.x = view.center.x + offsetX
            return $0
            
        }(UIButton(primaryAction: nil))
        
    }
}


extension TabBarView: TabBarViewProtocol {
    func setControllers(controllers: [UIViewController]) {
        setViewControllers(controllers, animated: true)
    }
    
    
}