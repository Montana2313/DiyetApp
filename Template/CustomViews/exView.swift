//
//  exView.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class exView: UIView {
    static let referance = exView()
    var currentView = UIView() // arka planı karartma işlemi
    var parentView = UIView() // alertin ana ekranı eklemeler buraya yapılır
    var anaView = UIView()
    private var buttonforFirstItem = UIButton()
    private var buttonForSecondItem = UIButton()
    private var buttonSave = UIButton()
    private var buttonCloseButton = UIButton()
    private var firstItem = ""
    private var secondItem = ""
    private var selectedItem = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        parentView.backgroundColor = .white
        self.parentView.addSubview(self.anaView)
        self.buttonCloseButton = {
            let button = DefaultItems.referance.defButton(withText: "X", andButtonColor: cellColor)
            button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
            return button
        }()
        self.parentView.addSubview(buttonCloseButton)
    }
   required init?(coder aDecoder: NSCoder) {
        fatalError("Error occur show alerView")
   }
    @objc func firstItemTapped(){
        print("first ıtem tapped")
        self.setSelectedItem(with: self.firstItem)
        self.buttonSave.isEnabled = true
    }
    @objc func secondItemTapped(){
        print("secon item tapped")
        self.setSelectedItem(with: self.secondItem)
         self.buttonSave.isEnabled = true
    }
    @objc func saveButtonTapped(){
        print("save button Tapped")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "selected"), object: self, userInfo: ["selected" :self.selectedItem])
        self.parentView.removeFromSuperview()
        self.currentView.isHidden = false
    }
    func setFirstItem(with value:String){
        self.firstItem = value
        self.buttonforFirstItem = {
                let button = DefaultItems.referance.defButton(withText: self.firstItem, andButtonColor: anaViewColor)
                button.addTarget(self, action:#selector(firstItemTapped) , for: .touchUpInside)
                return button
        }()
        self.parentView.addSubview(buttonforFirstItem)
    }
    func setSecondItem(with value:String){
        self.secondItem = value
        if secondItem != "" {
            self.buttonForSecondItem = {
                    let button = DefaultItems.referance.defButton(withText: self.secondItem, andButtonColor: anaViewColor)
                    button.addTarget(self, action: #selector(secondItemTapped), for: .touchUpInside)
                    return button
            }()
            self.parentView.addSubview(buttonForSecondItem)
        }
    }
    func setSelectedItem(with value:String){
        self.selectedItem = value
        print(String(describing:self.selectedItem ))
        UIView.animate(withDuration: 0.5) {
            self.buttonSave.backgroundColor = .green
        }
    }
   func showAlert(with view : UIView)
      {
           let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
           window?.addSubview(self.parentView)
           self.parentView.frame = CGRect(x:-1*(screenWith - 40), y:(screenHeigth*0.5) - 200, width:screenWith - 40, height: 400)
           self.buttonSave = {
                if self.secondItem != ""{
                    let button = DefaultItems.referance.defButton(withText:"Öğün olara ekle", andButtonColor: .gray)
                    button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
                    button.isEnabled = false
                    return button
                }else {
                    self.buttonforFirstItem.isEnabled = false
                    self.selectedItem = self.firstItem
                    let button = DefaultItems.referance.defButton(withText:"Öğün olara ekle", andButtonColor: .green)
                    button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
                    button.isEnabled = true
                    return button
                 }
            }()
           self.parentView.addSubview(buttonSave)
           currentView = view
           currentView.isHidden = true
           UIView.animate(withDuration: 1.0) {
                self.parentView.frame = CGRect(x: 20, y:(screenHeigth*0.5) - 200, width:screenWith - 40, height: 400)
                self.buttonCloseButton.frame = CGRect(x: self.parentView.frame.size.width - 50, y: 15, width: 40, height: 40)
                self.buttonforFirstItem.frame = CGRect(x: 20, y: self.parentView.frame.size.height - 300, width: self.parentView.frame.size.width - 40, height: 50)
                self.buttonForSecondItem.frame = CGRect(x: 20, y: self.parentView.frame.size.height - 240, width: self.parentView.frame.size.width - 40, height: 50)
                self.buttonSave.frame = CGRect(x: 20, y: self.parentView.frame.size.height - 180, width: self.parentView.frame.size.width - 40, height: 50)
              CustomizeItems.referance.roundedButton25(with: self.buttonSave)
                CustomizeItems.referance.roundedButton25(with: self.buttonForSecondItem)
                CustomizeItems.referance.roundedButton25(with: self.buttonforFirstItem)
                CustomizeItems.referance.roundedbuttons(with: self.buttonCloseButton)
          }
     }
    @objc func closeTapped() {
            self.parentView.removeFromSuperview()
            self.currentView.isHidden = false
            self.firstItem = ""
            self.secondItem = ""
            self.selectedItem = ""
            self.buttonforFirstItem.removeFromSuperview()
            self.buttonForSecondItem.removeFromSuperview()
            self.buttonSave.removeFromSuperview()
            UIView.animate(withDuration: 1.0) {
                self.parentView.frame = CGRect(x:-1*(screenWith - 40), y:(screenHeigth*0.5) - 200, width:screenWith - 40, height: 400)
            }
       }
}
