//
//  GettingStarted.swift
//  Template
//
//  Created by Mac on 14.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class GettingStarted: UIViewController {
    private var first = UIView()
    private var maleButton = UIButton()
    private var femaleButton = UIButton()
    private var separator = UIView()
    private var askLabel = UILabel()
    //
    private var second = UIView()
    private var yasLabel = UILabel()
    private var Yasslider = UISlider()
    private var boyLabel = UILabel()
    private var boySlider = UISlider()
    private var kiloLabel = UILabel()
    private var kiloSlider = UISlider()
    private var doneButton = UIButton()
    //
    private var lowestButton = UIButton()
    private var lowButton = UIButton()
    private var middleButton = UIButton()
    private var highButton = UIButton()
    private var highestButton = UIButton()
    
    private var selectedgenderType:Gender? = nil
    private var selectedsportType:SportType? = nil
    private var boyValue = 0
    private var kiloValue = 0
    private var yasValue = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
        setUserDefaultsString(withValue: returnCurrentDate(), forKey: "currentDate")
        print("Date has been saved")
        if getDataStatus() == false {
            SetAndGetFiles.referance.setAllFoods()
            print("Bitti")
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(GettingStarted.swipeLeft(gesture:)))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func swipeLeft(gesture: UIGestureRecognizer){
        if selectedsportType != nil || selectedgenderType != nil{
            UIView.animate(withDuration: 1.0) {
                self.first.frame = CGRect(x:-1*(screenWith  + 40), y: 150, width: screenWith - 40, height: screenHeigth - 300)
            }
            UIView.animate(withDuration: 1.0) {
                self.second.frame = CGRect(x: 20, y: 150, width: screenWith - 40, height: screenHeigth - 300)
            }
        }
    }
    @objc func genderButton(button:UIButton){
        if button.tag == 1{
            selectedgenderType = .Male
            UIView.animate(withDuration: 0.5) {
                self.maleButton.backgroundColor = insideColor
                self.maleButton.setTitleColor(.white, for: .normal)
                self.femaleButton.backgroundColor = .white
                self.femaleButton.setTitleColor(.black, for: .normal)
            }
        }else {
            selectedgenderType = .Female
            UIView.animate(withDuration: 0.5) {
                self.femaleButton.backgroundColor = insideColor
                self.femaleButton.setTitleColor(.white, for: .normal)
                self.maleButton.backgroundColor = .white
                self.maleButton.setTitleColor(.black, for: .normal)
            }
        }
        
        print(selectedgenderType as Any)
    }
    @objc func sportButton(button:UIButton){
        if button.tag == 3{
            selectedsportType = .Lowest
            UIView.animate(withDuration: 0.5) {
                self.lowestButton.backgroundColor = insideColor
                self.lowestButton.setTitleColor(.white, for: .normal)
                self.lowButton.backgroundColor = .white
                self.lowButton.setTitleColor(.black, for: .normal)
                self.middleButton.backgroundColor = .white
                self.middleButton.setTitleColor(.black, for: .normal)
                self.highButton.backgroundColor = .white
                self.highButton.setTitleColor(.black, for: .normal)
                self.highestButton.backgroundColor = .white
                self.highestButton.setTitleColor(.black, for: .normal)
            }
        }else if button.tag == 4{
            selectedsportType = .Low
            UIView.animate(withDuration: 0.5) {
                self.lowButton.backgroundColor = insideColor
                self.lowButton.setTitleColor(.white, for: .normal)
                self.lowestButton.backgroundColor = .white
                self.lowestButton.setTitleColor(.black, for: .normal)
                self.middleButton.backgroundColor = .white
                self.middleButton.setTitleColor(.black, for: .normal)
                self.highButton.backgroundColor = .white
                self.highButton.setTitleColor(.black, for: .normal)
                self.highestButton.backgroundColor = .white
                self.highestButton.setTitleColor(.black, for: .normal)
            }
        }else if button.tag == 5{
            selectedsportType = .Middle
            UIView.animate(withDuration: 0.5) {
                self.middleButton.backgroundColor = insideColor
                self.middleButton.setTitleColor(.white, for: .normal)
                self.lowestButton.backgroundColor = .white
                self.lowestButton.setTitleColor(.black, for: .normal)
                self.lowButton.backgroundColor = .white
                self.lowButton.setTitleColor(.black, for: .normal)
                self.highButton.backgroundColor = .white
                self.highButton.setTitleColor(.black, for: .normal)
                self.highestButton.backgroundColor = .white
                self.highestButton.setTitleColor(.black, for: .normal)
            }
        }else if button.tag == 6{
            selectedsportType = .High
            UIView.animate(withDuration: 0.5) {
                self.highButton.backgroundColor = insideColor
                self.highButton.setTitleColor(.white, for: .normal)
                self.lowestButton.backgroundColor = .white
                self.lowestButton.setTitleColor(.black, for: .normal)
                self.lowButton.backgroundColor = .white
                self.lowButton.setTitleColor(.black, for: .normal)
                self.middleButton.backgroundColor = .white
                self.middleButton.setTitleColor(.black, for: .normal)
                self.highestButton.backgroundColor = .white
                self.highestButton.setTitleColor(.black, for: .normal)
            }
        }else {
            selectedsportType = .Highest
            UIView.animate(withDuration: 0.5) {
                self.highestButton.backgroundColor = insideColor
                self.highestButton.setTitleColor(.white, for: .normal)
                self.lowestButton.backgroundColor = .white
                self.lowestButton.setTitleColor(.black, for: .normal)
                self.lowButton.backgroundColor = .white
                self.lowButton.setTitleColor(.black, for: .normal)
                self.middleButton.backgroundColor = .white
                self.middleButton.setTitleColor(.black, for: .normal)
                self.highButton.backgroundColor = .white
                self.highButton.setTitleColor(.black, for: .normal)
            }
        }
        
        print(selectedsportType as Any)
    }
    @objc func sliderchanged(slider:UISlider){
        if slider.tag == 1{
            self.yasLabel.text = "Yaşın :\(Int(slider.value))"
            self.yasValue = Int(slider.value)
        }else if slider.tag == 2 {
             self.boyLabel.text = "Boy ölçün :\(Int(slider.value))cm"
            self.boyValue = Int(slider.value)
        }else {
              self.kiloLabel.text = "Kilon :\(Int(slider.value))Kg"
            self.kiloValue = Int(slider.value)
        }
    }
    @objc func doneButtontapped(){
        if self.yasValue != 0 && self.kiloValue != 0 && self.boyValue != 0{
            if selectedgenderType == .Female{
                let kilocal = 9.6 * Double(self.kiloValue)
                let boycal = 1.8 * Double(self.boyValue)
                let yascal = 4.7 * Double(self.yasValue)
                let totalCal = 665 + Int(kilocal + boycal - yascal)
                print(totalCal)
                setUserDefaultsInt(withValue: totalCal, forKey: "totalcal")
            }else{
                let kilocal = 13.7 * Double(self.kiloValue)
                let boycal = 5.0 * Double(self.boyValue)
                let yascal = 6.8 * Double(self.yasValue)
                let totalCal = 66 + Int(kilocal + boycal - yascal)
                print(totalCal)
                setUserDefaultsInt(withValue: totalCal, forKey: "totalcal")
            }
            
            setUserDefaultsString(withValue: NSUUID().uuidString, forKey: "username")
            self.navigationController?.pushViewController(Anasayfa(), animated: true)
        }
    }
    
}
extension GettingStarted:SetUpViews{
    func setupViews() {
        self.first = {
            let view = DefaultItems.referance.defView(withColor: .white)
            view.frame = CGRect(x: 20, y: 150, width: screenWith - 40, height: screenHeigth - 300)
            CustomizeItems.referance.roundedView25(with: view)
            return view
        }()
        self.second = {
            let view = DefaultItems.referance.defView(withColor: .white)
            view.frame = CGRect(x: screenWith + 20, y: 150, width: screenWith - 40, height: screenHeigth - 300)
            CustomizeItems.referance.roundedView25(with: view)
            return view
        }()
        self.separator = {
            let view = DefaultItems.referance.defView(withColor: .gray)
            return view
        }()
        self.maleButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Erkek", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
            button.tag = 1
            button.addTarget(self, action: #selector(GettingStarted.genderButton(button:)), for: .touchUpInside)
            return button
        }()
        self.femaleButton = {
            let button =  DefaultItems.referance.defButtonWithLayer(text: "Kadın", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
            button.tag = 2
            button.addTarget(self, action: #selector(GettingStarted.genderButton(button:)), for: .touchUpInside)
            return button
        }()
        //
        self.askLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Ne kadar hareketlisin?", andLabelColor: .black)
            label.textAlignment = .center
            return label
        }()
        self.lowestButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Çok az", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
                  button.tag = 3
            button.addTarget(self, action: #selector(GettingStarted.sportButton(button:)), for: .touchUpInside)
            return button
        }()
        self.lowButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Az", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
                  button.tag = 4
            button.addTarget(self, action: #selector(GettingStarted.sportButton(button:)), for: .touchUpInside)
            return button
        }()
        self.middleButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Orta sıklık", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
                  button.tag = 5
            button.addTarget(self, action: #selector(GettingStarted.sportButton(button:)), for: .touchUpInside)
            return button
        }()
        self.highButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Sık", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
                  button.tag = 6
            button.addTarget(self, action: #selector(GettingStarted.sportButton(button:)), for: .touchUpInside)
            return button
        }()
        self.highestButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Çok sık", andButtoncolor: .white, borderColor: insideColor,textColor: .black)
                  button.tag = 7
            button.addTarget(self, action: #selector(GettingStarted.sportButton(button:)), for: .touchUpInside)
            return button
        }()
        self.yasLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Yaşın:10", andLabelColor: .black)
            label.textAlignment = .center
            return label
        }()
        self.Yasslider = {
            let slider = UISlider()
            slider.minimumValue = 10
            slider.maximumValue = 80
            slider.isContinuous = true
            slider.tintColor = cellColor
            slider.tag = 1
            slider.addTarget(self, action: #selector(sliderchanged(slider:)), for: .valueChanged)
            return slider
        }()
        self.boyLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Boy ölçün:150cm", andLabelColor: .black)
            label.textAlignment = .center
            return label
        }()
        self.boySlider = {
            let slider = UISlider()
            slider.minimumValue = 150
            slider.maximumValue = 210
            slider.isContinuous = true
            slider.tintColor = cellColor
            slider.tag = 2
            slider.addTarget(self, action: #selector(sliderchanged(slider:)), for: .valueChanged)
            return slider
        }()
        self.kiloLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Kilo durumun:40Kg", andLabelColor: .black)
            label.textAlignment = .center
            return label
        }()
        self.kiloSlider = {
            let slider = UISlider()
            slider.minimumValue = 40
            slider.maximumValue = 150
            slider.isContinuous = true
            slider.tintColor = cellColor
            slider.tag = 3
            slider.addTarget(self, action: #selector(sliderchanged(slider:)), for: .valueChanged)
            return slider
        }()
        self.doneButton = {
            let button = DefaultItems.referance.defButtonWithLayer(text: "Tamamla", andButtoncolor: cellColor, borderColor: cellColor,textColor: .white)
            button.addTarget(self, action: #selector(GettingStarted.doneButtontapped), for: .touchUpInside)
            return button
        }()
        
        self.first.addSubview(maleButton)
        self.first.addSubview(femaleButton)
        self.first.addSubview(self.separator)
        self.first.addSubview(self.askLabel)
        
        self.first.addSubview(self.lowestButton)
        self.first.addSubview(self.lowButton)
        self.first.addSubview(self.middleButton)
        self.first.addSubview(self.highButton)
        self.first.addSubview(self.highestButton)
        
        self.second.addSubview(self.Yasslider)
        self.second.addSubview(self.yasLabel)
        self.second.addSubview(self.boySlider)
        self.second.addSubview(self.boyLabel)

        self.second.addSubview(self.kiloLabel)
        self.second.addSubview(self.kiloSlider)

        self.second.addSubview(self.doneButton)

        
        self.view.addSubview(self.first)
        self.view.addSubview(self.second)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.maleButton.frame = CGRect(x: 10, y: 20, width: self.first.frame.size.width - 20, height: 40)
        self.femaleButton.frame = CGRect(x: 10, y: 70, width: self.first.frame.size.width - 20, height: 40)
        self.separator.frame = CGRect(x: 0, y: 120, width: self.first.frame.size.width, height: 5)
        self.askLabel.frame = CGRect(x: 5, y: 130, width: self.first.frame.size.width - 10, height: 30)
        self.lowestButton.frame = CGRect(x: 20, y: 170, width: self.first.frame.size.width - 40, height: 40)
        self.lowButton.frame = CGRect(x: 20, y: 220, width: self.first.frame.size.width - 40, height: 40)
        self.middleButton.frame = CGRect(x: 20, y: 270, width: self.first.frame.size.width - 40, height: 40)
        self.highButton.frame = CGRect(x: 20, y: 320, width: self.first.frame.size.width - 40, height: 40)
        self.highestButton.frame = CGRect(x: 20, y: 370, width: self.first.frame.size.width - 40, height: 40)
        
        self.yasLabel.frame = CGRect(x: 20, y: 20, width: self.second.frame.size.width - 40, height: 40)
        self.Yasslider.frame = CGRect(x: 20, y: 70, width: self.second.frame.size.width - 40, height: 40)
        self.boyLabel.frame = CGRect(x: 20, y: 120, width: self.second.frame.size.width - 40, height: 40)
        self.boySlider.frame = CGRect(x: 20, y: 170, width: self.second.frame.size.width - 40, height: 40)
        self.kiloLabel.frame = CGRect(x: 20, y: 220, width: self.second.frame.size.width - 40, height: 40)
        self.kiloSlider.frame = CGRect(x: 20, y: 270, width: self.second.frame.size.width - 40, height: 40)
        self.doneButton.frame = CGRect(x: 20, y: self.second.frame.size.height - 100, width: self.second.frame.size.width - 40, height: 50)
        
        
        CustomizeItems.referance.roundedButton25(with: self.maleButton)
        CustomizeItems.referance.roundedButton25(with: self.femaleButton)
        CustomizeItems.referance.roundedButton25(with: self.lowestButton)
        CustomizeItems.referance.roundedButton25(with: self.lowButton)
        CustomizeItems.referance.roundedButton25(with: self.middleButton)
        CustomizeItems.referance.roundedButton25(with: self.highButton)
        CustomizeItems.referance.roundedButton25(with: self.highestButton)
        
        
        
    }
}
