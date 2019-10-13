//
//  User.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    static let instance  = User()
    
    func createUser(email : String , password : String, username : String,isUser :@escaping (Bool) -> Void)
    {
        checkUser(username: username, mail: email) { (exists) in
            if exists == true{
                isUser(false)
            }
            else {
//                Auth.auth().createUser(withEmail: email , password: password) { (User, error) in
//                    if error == nil
//                    {
//                        self.setUserInDatabase(userUUID: (User?.user.uid)!, username: username, email: email, clousre: {
//                            isUser(true)
//                        })
//                        UserDefaults.standard.set(username, forKey: "username")
//                        UserDefaults.standard.synchronize()
//                    }
//                    else {fatalError(error!.localizedDescription)}
//                }
            }
        }
    }
    func resetPassword(withResetText : String , closure:@escaping (Bool)->Void){
//        Auth.auth().sendPasswordReset(withEmail: withResetText) { (error) in
//            if error != nil {
//                closure(false)
//
//            }else {
//                closure(true);
//            }
//        }
    }
    private func setUserInDatabase(userUUID : String , username : String , email : String,  clousre : () -> Void)
    {
//        let db = Firestore.firestore()
//        let sentdata = ["username":username , "email":email]
//        db.collection("Users").document(userUUID).setData(sentdata)
//
//        clousre()
//        // üye bilgiler databse kayıt olacak
    }
    // eğer image Eklenirse buradan eklenebilir.
   
    func setUserImage(userImage : UIImage , closure : @escaping()->Void){
//        sentURLFromImage(userImage: userImage) { (url) in
//            if url.absoluteString != "" {
//                let db = Firestore.firestore()
//                let setValue = ["userImageURL":url.absoluteString]
//                db.collection("UserImages").document(currentUserId).setData(setValue)
//                closure()
//            }else {
//                fatalError("resim urli alınamadı..")
//            }
//        }
    }
    private func sentURLFromImage(userImage : UIImage , closure : @escaping (URL) -> Void)
    {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        let mediaobject = storageRef.child("media")
//
//        if let data = userImage.jpegData(compressionQuality: 0.5)
//        {
//            let uuid = NSUUID().uuidString
//            let mediaimage = mediaobject.child("\(uuid).jpg")
//
//            mediaimage.putData(data, metadata: nil) { (storageData, error) in
//                if error == nil{
//                    mediaimage.downloadURL(completion: { (URL, error2) in
//                        if error2 == nil
//                        {
//                            closure(URL!)
//                        }
//                    })
//                }
//                else {fatalError(error!.localizedDescription)}
//            }
//
//        }
    }
    private func checkUser(username : String , mail : String , clousere : @escaping (Bool) -> Void)
    {
//        let db = Firestore.firestore()
//        db.collection("Users").whereField("username", isEqualTo: username).getDocuments { (snapshot, error) in
//            if error == nil{
//                if snapshot!.documents.count == 0 {
//                    clousere(false)
//                }else {
//                    clousere(true)
//                }
//            }
//        }
    }
    private func sentEmail(withUsername:String,closure:@escaping(String)->Void){
//        let db = Firestore.firestore()
//        db.collection("Users").whereField("username", isEqualTo: withUsername).getDocuments { (snapshot, error) in
//            if error == nil{
//                if snapshot!.documents.count == 0 {
//                    closure("")
//                }else {
//                    let item = snapshot!.documents.first
//                    closure(item!["email"] as! String)
//                }
//            }
//        }
    }
    func login(username : String , password : String , isUser : @escaping (Bool) -> Void)
    {
        sentEmail(withUsername: username) { (email) in
//            Auth.auth().signIn(withEmail: email, password: password) { (User, error) in
//                if error == nil{
//                    isUser(true)
//                    UserDefaults.standard.set(username, forKey: "username")
//                    UserDefaults.standard.synchronize()
//                }
//                else {
//                    isUser(false)
//                }
//            }
        }
    }
    func logout(process : () -> Void)
    {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.synchronize()
        
//        try! Auth.auth().signOut()
        
        process()
    }
}
