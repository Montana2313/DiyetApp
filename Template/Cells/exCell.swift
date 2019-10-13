//
//  exCell.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
class exCell: UITableViewCell {
       var foodName: UILabel = {
           let lbl = UILabel()
           lbl.textColor = UIColor.black
           lbl.textAlignment = .center
           return lbl
       }()
       let anaView : UIView = {
           let view = UIView()
           view.backgroundColor = cellColor
           view.frame = CGRect(x: 5, y: 0, width: screenWith - 30, height: 95.0)
           CustomizeItems.referance.roundedView25(with: view)
           return view
       }()

       override func awakeFromNib() {
           super.awakeFromNib()
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style , reuseIdentifier: reuseIdentifier)
           foodName.frame = CGRect(x: 10, y: 30, width: anaView.frame.size.width - 20, height: 30)
           anaView.addSubview(foodName)
           self.addSubview(anaView)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
}
