//
//  Anasayfa.swift
//  Template
//
//  Created by Mac on 10.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreML
import Vision

class Anasayfa: AppBar {
    private var middleView = UIView()
    private var leftButton = UIButton()
    private var rightButton = UIButton()
    private var tableView = UITableView()
    private var middleKaloriView = UIView()
    private var insideKaloriView = UIView()
    private var calLabel = UILabel()
    private var foodArrays = [String]() // şimdilik böyle ilerde kaloriler ile birlikte görüncek şekilde olacak
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = masterColor
        setupViews()
        setupFrameWithPhone(withdeviceName: getDeviceModel())
        
        NotificationCenter.default.addObserver(self, selector: #selector(setterOfselectedValue(notification:)), name: NSNotification.Name(rawValue: "selected"), object: nil)
    }
    private func calcMiddView(totalCal:Int,currentCal:Int){
        let percentage = (currentCal * 100) / totalCal
        let percWith:Double = Double((Int(self.middleKaloriView.frame.size.width) * percentage) / 100)
        UIView.animate(withDuration: 1.0) {
            self.insideKaloriView.frame = CGRect(x: 0, y: 0, width: percWith, height: Double(self.middleKaloriView.frame.size.height))
        }
    }
    @objc func setterOfselectedValue(notification: Notification){
        guard let userInfo = notification.userInfo else{fatalError("veri gelmedi")}
        if let selected = userInfo["selected"] as? String {
            print(selected)
            self.foodArrays.append(selected)
            self.tableView.reloadData()
            // buradaki alt view a ekleme yapıalacak
        }
    }
    @objc func takeAPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker,animated: true,completion: nil)
    }
    @objc func foods(){
        self.navigationController?.pushViewController(Foods(), animated: true)
    }
}
extension Anasayfa:SetUpViews{
    func setupViews() {
        self.middleView = {
            let view = DefaultItems.referance.defView(withColor: anaViewColor)
            return view
        }()
        self.leftButton = {
            let button = DefaultItems.referance.defButton(withText: "Çek", andButtonColor: anaViewColor)
            button.addTarget(self, action: #selector(Anasayfa.takeAPhoto), for: .touchUpInside)
            return button
        }()
        self.rightButton = {
            let button = DefaultItems.referance.defButton(withText: "Yemekler", andButtonColor: anaViewColor)
            button.addTarget(self, action: #selector(Anasayfa.foods), for: .touchUpInside)
            return button
        }()
        self.tableView = {
            let tableView = DefaultItems.referance.defTableView(with: exCell.self)
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
        }()
        self.insideKaloriView = {
            let view = DefaultItems.referance.defView(withColor: insideColor)
            return view
        }()
        self.middleKaloriView = {
            let view = DefaultItems.referance.defView(withColor: .white)
            return view
        }()
        self.calLabel = {
            let label = DefaultItems.referance.defLabel(withText: "2000cal/3000cal", andLabelColor: .white)
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica", size: 25.0)
            return label
        }()
        CustomizeItems.referance.customAppBarButtons(with: self.leftButton, andRigth: self.rightButton, currentView:self.appBar)
        self.middleKaloriView.addSubview(self.insideKaloriView)
        self.middleView.addSubview(middleKaloriView)
        self.middleView.addSubview(self.calLabel)
        self.view.addSubview(self.middleView)
        self.view.addSubview(self.tableView)
    }
    func setupFrameWithPhone(withdeviceName: PhoneType) {
        self.middleView.frame = CGRect(x: 10, y: 100, width: screenWith - 20, height: screenHeigth - 500)
        self.tableView.frame = CGRect(x: 10, y: screenHeigth - 390, width: screenWith - 20, height: screenHeigth - (screenHeigth - 390))
        self.middleKaloriView.frame = CGRect(x: 20, y: (self.middleView.frame.size.height / 2) - 50, width: self.middleView.frame.size.width - 40, height: 50)
        self.insideKaloriView.frame = CGRect(x: 0, y: 0, width: 20, height: self.middleKaloriView.frame.size.height)
        self.calLabel.frame = CGRect(x: 10, y: (self.middleView.frame.size.height / 2) + 10, width:self.middleView.frame.width - 20, height: 50)
        CustomizeItems.referance.roundedView25(with: self.middleView)
        self.calcMiddView(totalCal: 3000, currentCal: 2000)
    }
    private func findBestfood(image : CIImage,process:@escaping(String,String,Bool)->Void){
        if  let model =  try? VNCoreMLModel(for: FoodDataModel().self.model){
            // eğer model var ise
            let request = VNCoreMLRequest(model: model) { (Requst, error) in
                if error == nil {
                    if let results = Requst.results as? [VNClassificationObservation]{
                        guard let itemFirst = results.first else {fatalError("error")}
                        let conf = (itemFirst.confidence) * 100
                        let rounded = Int(conf * 100) / 100
                        if rounded > 90 {
                            process(itemFirst.identifier,"",false)
                        }else {
                            let itemSecond = results[1]
                            process(itemFirst.identifier,itemSecond.identifier,true)
                        }
                    }
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
                           DispatchQueue.global(qos: .userInteractive).async {
                               do {
                                   try handler.perform([request])
                               }
                               catch{
                                   print("Hata")
                               }
                               
                }
        }
      
    }
}
extension Anasayfa:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {fatalError("error")}
        self.dismiss(animated: true) {
            // image recognaizer
            if let ciimage = CIImage(image: selectedImage){
                self.findBestfood(image: ciimage) { (first, seconde,status) in
                    if status == false {
                        DispatchQueue.main.async {
                            exView.referance.setFirstItem(with: first)
                            exView.referance.showAlert(with: self.view)
                        }
                        
                    }else {
                         DispatchQueue.main.async {
                             exView.referance.setFirstItem(with: first)
                             exView.referance.setSecondItem(with: seconde)
                                exView.referance.showAlert(with: self.view)
                        }
                    }
                }
            }
        }
    }
}

extension Anasayfa:UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as? exCell else {fatalError("error")}
        cell.foodName.text = self.foodArrays[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}