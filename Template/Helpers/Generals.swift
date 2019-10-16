//
//  Generals.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
//import NVActivityIndicatorView

//TANIMLAMALAR
let screenWith = UIScreen.main.bounds.width
let screenHeigth = UIScreen.main.bounds.height
let masterColor = UIColor.white
let appBarColor = UIColor(red:0.70, green:0.89, blue:0.84, alpha:1.0)
let anaViewColor = UIColor(red:0.42, green:0.48, blue:0.58, alpha:1.0)
let cellColor = UIColor(red:0.55, green:0.73, blue:0.73, alpha:1.0)
let insideColor = UIColor(red:0.27, green:0.25, blue:0.35, alpha:1.0)
// REnK TANIMLAMALARI

var currentUserId : String {
    get{
//        return Auth.auth().currentUser!.uid
         return ""
    }
}
//FOMKSİYONLAR
func getDeviceModel() -> PhoneType {
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else {fatalError("error")}
    let deviceModel : PhoneType = appDel.deviceModel()
    return deviceModel
}
//func getCustomLoader() -> NVActivityIndicatorView{
//     let loader = NVActivityIndicatorView(frame: CGRect(x:(screenWith / 2) - 50, y: (screenHeigth / 2) - 50, width: 100, height: 100), type: .orbit, color: buttoncolor, padding: 0)
//    return loader
//}
func getUserName()->String {
    if let username = UserDefaults.standard.string(forKey: "username"){
        return username
    }
    return ""
}
func getUserFoods()->[String]?{
    if let foods = UserDefaults.standard.stringArray(forKey: "userFoods"){
        return foods
    }
    return nil
}
func getSaveCurrentData()->String{
    if let date = UserDefaults.standard.string(forKey: "saveDate"){
        return date
    }
    return ""
}
func setUserDefaultsAny(any:Any,forkey:String){
    UserDefaults.standard.setValue(any, forKey: forkey)
    UserDefaults.standard.synchronize()
}
func gettotalCal()->Int {
    return UserDefaults.standard.integer(forKey: "totalcal")
}
func getCurrentCal()->Int?{
    return UserDefaults.standard.integer(forKey: "currentCal")
}
func setUserDefaultsString(withValue:String,forKey:String){
    UserDefaults.standard.setValue(withValue, forKey: forKey)
    UserDefaults.standard.synchronize()
}
func setUserDefaultsInt(withValue:Int,forKey:String){
    UserDefaults.standard.set(withValue, forKey: forKey)
    UserDefaults.standard.synchronize()
}
func removeUserDefaultString(forkey:String){
    UserDefaults.standard.removeObject(forKey: forkey)
    UserDefaults.standard.synchronize()
}
func createDefaultAlert(withTitle:String , andDesc:String , andButtonTitle:String)->UIAlertController{
    let alertController = UIAlertController(title: withTitle, message: andDesc, preferredStyle: .alert)
    let actionButton = UIAlertAction(title: andButtonTitle, style: .cancel, handler: nil)
    alertController.addAction(actionButton)
    return alertController
}
func returnCurrentDate(){
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    print(dateFormatter.string(from: currentDate))
    //Saate göre veri silmesi yapacak
}
//PROTOKOLLER
protocol CreateView {
    func MasterPage()
}
protocol SetUpViews {
    func setupViews()
    func setupFrameWithPhone(withdeviceName:PhoneType)
}
protocol FirebaseProcess {
    func getFirebaseDatas() // Veriler burada çekilir.
    func setDataOnFirebase() // Veriler burada aktarılır.
}
// ENUMLAR
enum PageType {
    // Page Names
    case Anasayfa
}
enum PhoneType {
    // Phone Types
    case iPhoneXR
    case iPhoneX
    case iPhoneXSMax
    case iPhone8Plus
    case iPhone8
    case iPhoneSE
    case Hata
}
enum Gender{
    case Male
    case Female
}
enum SportType{
    case Lowest
    case Low
    case Middle
    case High
    case Highest
}
