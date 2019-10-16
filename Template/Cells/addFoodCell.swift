//
//  addFoodCell.swift
//  Template
//
//  Created by Mac on 16.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit


class addFoodCell:UITableViewCell {
    static let referance = addFoodCell()
    private var foodID = ""
    private var currentCal = 0
    let anaView : UIView = {
        let view = UIView()
        view.backgroundColor = cellColor
        view.frame = CGRect(x: 5, y: 0, width: screenWith - 30, height: 95.0)
        CustomizeItems.referance.roundedView25(with: view)
        return view
    }()
    let foodName : UILabel = {
        let nameLabel = DefaultItems.referance.defLabel(withText: "", andLabelColor: .black)
        return nameLabel
    }()
    let addButton :UIButton = {
        let button = DefaultItems.referance.defButton(withText: "+", andButtonColor: insideColor)
        return button
    }()
    func setterId(id:String){
        self.foodID = id
    }
    func setterCal(cal:Double){
        self.currentCal = Int(cal)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(anaView)
        
    }
    @objc func addButtonTapped(){
        print(self.foodID)
        setuserFood {
            setuserCal()
            UIView.animate(withDuration: 2.0) {
                           self.addButton.backgroundColor = .green
                       }
                       UIView.animate(withDuration: 2.0) {
                           self.addButton.backgroundColor = insideColor
            }
        }
    }
    private func setuserFood(process:()->Void){
        if getUserFoods() != nil{
               var currentFoods = getUserFoods()
               currentFoods!.append(self.foodID)
               setUserDefaultsAny(any: currentFoods!, forkey: "userFoods") // id eklendi
               print("Değer var ekleme başarılı")
           }else {
               var foodArray = [String]()
               foodArray.append(self.foodID)
               setUserDefaultsAny(any: foodArray, forkey: "userFoods")
               print("Değer oluşturuldu ve ekleme başarılı")
           }
        
        process()
    }
    private func setuserCal(){
            if getCurrentCal() != nil{
                self.currentCal += getCurrentCal()!
                setUserDefaultsInt(withValue: self.currentCal, forKey: "currentCal")
            }else {
                setUserDefaultsInt(withValue: self.currentCal, forKey: "currentCal")
            }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        self.foodName.frame = CGRect(x: 10, y: 20, width: screenWith - 30, height: 50)
        self.addButton.frame = CGRect(x: screenWith - 90, y: 20, width: 50, height: 50)
        self.addButton.addTarget(self, action: #selector(addFoodCell.addButtonTapped), for: .touchUpInside)
        CustomizeItems.referance.roundedbuttons(with: self.addButton)
        self.anaView.addSubview(foodName)
        self.anaView.addSubview(addButton)
        self.addSubview(anaView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
