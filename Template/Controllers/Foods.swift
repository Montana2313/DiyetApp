//
//  Foods.swift
//  Template
//
//  Created by Mac on 10.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Foods: UIViewController {
    private var backButton = UIButton()
    private var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = masterColor
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
    }
    @objc func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
}
extension Foods:SetUpViews{
    func setupViews() {
        self.backButton = {
            let button = DefaultItems.referance.defButtonW(withImageName: "backButton")
            button.addTarget(self, action: #selector(Foods.backButtonTapped), for: .touchUpInside)
            return button
        }()
        self.tableView = {
            let tableView = DefaultItems.referance.defTableView(with: nil)
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
        }()
        self.view.addSubview(backButton)
        self.view.addSubview(tableView)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.tableView.frame = CGRect(x: 10, y: 90, width: screenWith - 20, height: screenHeigth - 100)
        self.backButton.frame = CGRect(x: 20, y: 40, width: 20, height: 30)
    }
}
extension Foods:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Pilav"
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
