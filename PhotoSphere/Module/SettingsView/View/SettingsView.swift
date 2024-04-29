//
//  SettingsViewViewController.swift
//  PhotoSphere
//
//  Created by mac on 28.04.2024.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    var tableView: UITableView {get set}
}

class SettingsView: UIViewController , SettingsViewProtocol{
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.backgroundColor = .appBlack
        $0.separatorStyle = .none
        $0.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseID)
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    
    var presenter: SettingsViewPresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = .appMain
        navigationController?.navigationBar.barTintColor = .appBlack
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        title = "Настройки"
      
        view.backgroundColor = .appBlack

        
    }
}

extension  SettingsView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingsItem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as! SettingsCell
        let cellItem = SettingsItem.allCases[indexPath.row]
        cell.cellSetup(cellType: cellItem)
        
        cell.completion = {
            if indexPath.row == 0{
                let passcodeVC = Builder.getPasscodeController(passcodeState: .setNewPasscode, sceneDelegate: nil, isSetting: true)
                self.present(passcodeVC, animated: true)
            }
        }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    
}
