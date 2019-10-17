//
//  SetAndGetFiles.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SetAndGetFiles {
    static let referance = SetAndGetFiles()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func setObject(foodName:String,cal:Double){
        let item = Food(context: self.context)
        item.foodName = foodName
        item.cal = cal
        item.id = NSUUID().uuidString
        self.saveItems()
        print("Saved")
    }
    func setAllFoods(){
        setObject(foodName: "Patetes Kızartması", cal: 311.9)
        setObject(foodName: "Pilav", cal: 359.2)
        setObject(foodName: "Kırmızı Et", cal: 250)
        setObject(foodName: "Köfte", cal: 196.9)
        setObject(foodName: "Pirzola", cal: 112)
        setObject(foodName: "Beyaz Et", cal: 239)
        setObject(foodName: "Tavuk Sote", cal: 288)
        setObject(foodName: "Salatalık", cal: 15)
        setObject(foodName: "Domates", cal: 33)
        setObject(foodName: "Unlu mamüller", cal: 260)
        setObject(foodName: "Büyük Poğaça", cal: 430)
        setObject(foodName: "Küçük Poğaça", cal: 238)
        setObject(foodName: "Makarna", cal: 131)
        setObject(foodName: "Pizza", cal: 266)
        setObject(foodName: "Büyük Pizza", cal: 400)
        setObject(foodName: "Biber", cal: 39.9)
        setObject(foodName: "Çorba", cal: 24)
        setObject(foodName: "Ramen", cal: 436)
        setObject(foodName: "Sebze Suyu", cal: 5)
        setObject(foodName: "Düğün Çorbası", cal: 100)
        setObject(foodName: "Domates Çorbası", cal: 30)
        setObject(foodName: "Mercimek Çorbası", cal: 56)
        setObject(foodName: "Tavuk Suyu", cal: 16)
        setObject(foodName: "Çikolata", cal: 546.6)
        setObject(foodName: "Bitter Çikolata", cal: 479)
        setObject(foodName: "Beyaz Çikolata", cal: 538.7)
        setObject(foodName: "Kuruyemiş", cal: 606.8)
        setObject(foodName: "Fıstık", cal: 562.1)
        setObject(foodName: "Fındık", cal: 628.3)
        setObject(foodName: "Kaju", cal: 553)
        setObject(foodName: "Leblebi", cal: 350)
        setObject(foodName: "Pasta", cal: 251.9)
        setObject(foodName: "Waffle", cal: 291.1)
        setObject(foodName: "Mozaik Pasta", cal: 368)
        setObject(foodName: "Kahveli Pasta", cal: 331)
        setObject(foodName: "Muz", cal: 88.7)
        setObject(foodName: "Elma", cal: 52.1)
        setObject(foodName: "Çilek", cal: 32.5)
        setObject(foodName: "Armut", cal: 57.1)
        setObject(foodName: "Salata", cal: 152.5)
        setObject(foodName: "Çoban Salatası", cal: 52)
        setObject(foodName: "Akdeniz Salatası", cal: 117.15)
        setObject(foodName: "Bezelye", cal: 81)
        setObject(foodName: "İmam bayıldı", cal: 164)
        setObject(foodName: "Pide", cal: 600)
        setObject(foodName: "Ton Balığı", cal: 186)
    }
    private func saveItems(){
        do {
            try   self.context.save()
        }catch{
            print("Error : \(error)")
        }
    }
    func readObject()->[Food]{
        let request : NSFetchRequest<Food> = Food.fetchRequest()
        var willSet = [Food]()
        do {
            willSet = try self.context.fetch(request)
        }catch{
            print("error : \(error)")
        }
        return willSet
    }
    func getobject(withName:String) -> Food? {
        let all = readObject()
        let lowerCase = withName.lowercased()
        for item in all {
            if item.foodName!.lowercased() == lowerCase{
                return item
            }
        }
        return nil
    }
    func getcurrentFoods()->[Food]?{
        let food = readObject()
        let userFoodIds = getUserFoods()
        var sentableArray = [Food]()
        if userFoodIds != nil{
            for itemFood in food{
                for itemUserFood in userFoodIds!{
                    if itemFood.id == itemUserFood{
                        sentableArray.append(itemFood)
                    }
                }
            }
        }
        return sentableArray
    }
}
