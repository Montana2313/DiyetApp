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
    private var selfSearchBar = UISearchBar()
    private var foodarray = [Food]()
    private var isSeaching:Bool = false
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
        self.selfSearchBar = {
            let searchBar = DefaultItems.referance.defSearchBar(withPlaceHolder: "Yiyecek ara")
            searchBar.delegate = self
            return searchBar
        }()
        self.tableView = {
            let tableView = DefaultItems.referance.defTableView(with: addFoodCell.self)
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
        }()
        self.view.addSubview(selfSearchBar)
        self.view.addSubview(backButton)
        self.view.addSubview(tableView)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.selfSearchBar.frame = CGRect(x: 20, y: 90, width: screenWith - 40, height: 40)
        self.tableView.frame = CGRect(x: 10, y: 140, width: screenWith - 20, height: screenHeigth - 140)
        self.backButton.frame = CGRect(x: 20, y: 40, width: 20, height: 30)
    }
}
extension Foods:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.count > 1 {
            self.isSeaching = true
            self.foodarray.removeAll(keepingCapacity: false)
            for item in SetAndGetFiles.referance.readObject(){
                if item.foodName!.contains(searchBar.text!){
                    self.foodarray.append(item)
                }
            }
            self.tableView.reloadData()
        }else {
            self.isSeaching = false
               self.foodarray.removeAll(keepingCapacity: false)
               self.tableView.reloadData()
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == self.tableView{
            self.view.endEditing(true)
        }
    }
}
extension Foods:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.foodarray.count > 0 {
            return self.foodarray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.isSeaching == true {
            if self.foodarray.count > 0 {
                guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as? addFoodCell else {fatalError("error")}
                cell.backgroundColor = .clear
                cell.isUserInteractionEnabled = true
                cell.foodName.text = "\(String(describing: self.foodarray[indexPath.row].foodName!)) -- \(self.foodarray[indexPath.row].cal) cal"
                cell.setterId(id: self.foodarray[indexPath.row].id ?? "")
                cell.setterCal(cal: self.foodarray[indexPath.row].cal)
                cell.textLabel?.text = "cell"
                return cell
            }
            let cell = UITableViewCell()
            cell.textLabel?.text = "Bulunamadı"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .black
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
            return cell
        }else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Arama yaparak başla"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .black
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
