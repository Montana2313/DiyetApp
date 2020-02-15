//
//  InfoScreen.swift
//  Template
//
//  Created by Mac on 15.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

/*
class InfoScreen: UIViewController {
    private var AppNameLabel : UILabel = UILabel()
    //
    private var documentView : UIView = UIView()
    private var documentImageView : UIImageView = UIImageView()
    private var documentLabel : UILabel = UILabel()
    //
    private var companyView : UIView = UIView()
    private var companyImageView : UIImageView = UIImageView()
    private var companyLabel : UILabel = UILabel()
    //
    private var rateView : UIView = UIView()
    private var rateImageView : UIImageView = UIImageView()
    private var rateLabel : UILabel = UILabel()
    //
    private var doneButton : UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorOfView
     //  SetAndGetFiles.instance.createCompanyTEST()
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
        animatawith(deviceName: getDeviceModel())
    }
    @objc func doneButtonTapped(){
        UserDefaults.standard.set(true, forKey: "firstOpening")
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {fatalError()}
        appDel.open_Page(withPage: .FirstScreen, withParam: nil)
    }
}
extension InfoScreen:SetUpViews{
    func setupViews() {
        self.AppNameLabel = {
            let label = DefaultItems.referance.defLabel(withText: "StajYerim", andLabelColor: buttoncolor)
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica", size: 30.0)
            return label
        }()
        self.documentView = {
            let view = DefaultItems.referance.defView(withColor: .clear)
            view.layer.borderWidth = 0.0
            return view
        }()
        self.documentImageView = {
            return UIImageView(image: UIImage(named: "DocumentIcon"))
        }()
        self.documentLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Kolayca insanların paylaştığı raporlara ulaş.", andLabelColor: .black)
            label.numberOfLines = 3
            return label
        }()
        self.companyView = {
            let view = DefaultItems.referance.defView(withColor: .clear)
            view.layer.borderWidth = 0.0
            return view
        }()
        self.companyImageView = {
            return UIImageView(image: UIImage(named: "CompanyIcon"))
        }()
        self.companyLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Staj yaptığın yerleri yorumlayarak insanlara bilgi sağla.", andLabelColor: .black)
            label.numberOfLines = 3
            return label
        }()
        self.rateView = {
            let view = DefaultItems.referance.defView(withColor: .clear)
            view.layer.borderWidth = 0.0
            return view
        }()
        self.rateImageView = {
            return UIImageView(image: UIImage(named: "RateIcon"))
        }()
        self.rateLabel = {
            let label = DefaultItems.referance.defLabel(withText: "Staj yaptığın yerlere puanlar vererek insanlara bilgi sağla.", andLabelColor: .black)
            label.numberOfLines = 3
            return label
        }()
        self.doneButton = {
            let btn = DefaultItems.referance.defButton(withText: "Başla", andButtonColor: buttoncolor)
            btn.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
            return btn
        }()
        
        self.documentView.addSubview(self.documentLabel)
        self.documentView.addSubview(self.documentImageView)
        
        self.companyView.addSubview(self.companyLabel)
        self.companyView.addSubview(self.companyImageView)
        
        self.rateView.addSubview(self.rateLabel)
        self.rateView.addSubview(self.rateImageView)
        
        
        self.view.addSubview(AppNameLabel)
        self.view.addSubview(documentView)
        self.view.addSubview(companyView)
        self.view.addSubview(rateView)
        self.view.addSubview(doneButton)
    }
    
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.AppNameLabel.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 50)
        self.documentView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 60)
        self.companyView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 60)
        self.rateView.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 40, height: 60)
        
        self.documentImageView.frame = CGRect(x: 5, y: 10, width: 40, height: 40)
        self.companyImageView.frame = CGRect(x: 5, y: 10, width: 40, height: 40)
        self.rateImageView.frame = CGRect(x: 5, y: 10, width: 40, height: 40)
        
        self.documentLabel.frame = CGRect(x: 50, y: 0, width: self.documentView.frame.size.width - 50, height: 60)
        self.companyLabel.frame = CGRect(x: 50, y: 0, width: self.companyView.frame.size.width - 50, height: 60)
        self.rateLabel.frame = CGRect(x: 50, y: 0, width: self.rateView.frame.size.width - 50, height: 60)
        
        self.doneButton.frame = CGRect(x: 20, y: screenHeigth + 100, width: screenWith - 50, height: 50)
        
        CustomizeItems.referance.roundedButton25(with: self.doneButton)
    }
    func animatawith(deviceName:PhoneType){
        UIView.animate(withDuration: 1.0) {
            self.AppNameLabel.frame = CGRect(x: 20, y: (screenHeigth / 2) - 200, width: screenWith - 40, height: 50)
            self.documentView.frame = CGRect(x: 20, y: (screenHeigth / 2) - 150, width: screenWith - 40, height: 60)
            self.companyView.frame = CGRect(x: 20, y: (screenHeigth / 2) - 80, width: screenWith - 40, height: 60)
            self.rateView.frame = CGRect(x: 20, y: (screenHeigth / 2) - 20, width: screenWith - 40, height: 60)
            self.doneButton.frame = CGRect(x: 20, y: screenHeigth - 100, width: screenWith - 40, height: 50)
        }
    }
    
    
}
*/
