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
    func getcurrentFoods()->[String]?{
        let food = readObject()
        let userFoodIds = getUserFoods()
        var sentableArray = [String]()
        if userFoodIds != nil{
            for itemFood in food{
                for itemUserFood in userFoodIds!{
                    if itemFood.id == itemUserFood{
                        sentableArray.append(itemFood.foodName ?? "error")
                    }
                }
            }
        }
        return sentableArray
    }
}
