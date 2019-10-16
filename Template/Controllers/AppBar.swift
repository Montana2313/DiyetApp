//
//  AppBar.swift
//  Template
//
//  Created by Mac on 10.10.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class AppBar: UIViewController {
    var appBar = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appBar = {
            let view = DefaultItems.referance.defAppBar(withColor: appBarColor, andText: "Günlük", labelcolor: .white)
            return view
        }()
        self.view.addSubview(self.appBar)
//        SetAndGetFiles.referance.setObject(foodName: "Beyaz Et", cal: 300.0)
        returnCurrentDate()
    }
}
