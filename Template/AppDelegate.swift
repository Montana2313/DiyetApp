//
//  AppDelegate.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        var viewcontrollerFirst:UIViewController = GettingStarted()
        // EĞER USER kontrolü var ise
           if getUserName() == ""{
                print("USERID YOK")
               viewcontrollerFirst = GettingStarted()
           }else {
               print("USERID VAR")
               print(getUserName())
            viewcontrollerFirst = Anasayfa()
           }
           
           let nav1 = UINavigationController()
           nav1.viewControllers = [viewcontrollerFirst]
           nav1.navigationBar.isHidden = true
           window!.rootViewController = nav1
           window?.makeKeyAndVisible()
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    func deviceModel() -> PhoneType{
          let bounds = UIScreen.main.bounds
          let screenWidth = bounds.width
          let screenHeight = bounds.height
          if screenWidth == 414.0 && screenHeight == 896.0{
              return PhoneType.iPhoneXR
          }else if screenWidth == 375.0 && screenHeight == 812.0{
              return PhoneType.iPhoneX
          }else if screenWidth == 414.0 && screenHeight == 896.0 {
              return PhoneType.iPhoneXSMax
          }else if screenWidth == 414.0 && screenHeight == 736.0{
              return PhoneType.iPhone8Plus
          }else if screenWidth == 375.0 && screenHeight == 667.0{
              return PhoneType.iPhone8
          }else if screenWidth == 320.0 && screenHeight == 568.0{
              return PhoneType.iPhoneSE
          }else {
              return PhoneType.Hata
          }
      }
    func open_Page(withPage pagetype:PageType,withParam:String?){
        // yönlendirme işlemleri bura üzerinden yapılacak
        if pagetype == PageType.Anasayfa{
            let rootView:Anasayfa = Anasayfa()
            self.seguePage(withController: rootView)
        }
    }
    private func seguePage(withController : UIViewController){
            if let window = self.window{
                UIView.transition(with: window, duration: 0.70, options: .transitionFlipFromTop, animations: {
    //                if withController.isKind(of: Anasayfa.classForCoder()) || withController.isKind(of: PlusVC.classForCoder()){
                        // HEPSİNDE GEREKLi değilse Comment out yapılır
                        let nav1 = UINavigationController()
                        nav1.viewControllers = [withController]
                        nav1.navigationBar.isHidden = true
                        self.window!.rootViewController = nav1
                        self.window?.makeKeyAndVisible()
    //                }else {
    //                    window.rootViewController = withController
    //                }
                }, completion: nil)
            }
        }
    // MARK: - Core Data stack
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "DataModel")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()

        // MARK: - Core Data Saving support
        func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}

