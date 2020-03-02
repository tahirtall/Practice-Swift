//
//  myShoppingList.swift
//  TahirUzun_Assignment5
//
//  Created by Tahir Uzun on 2/23/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import Foundation

class shoppingList {
    
    var quantity:String
    var desc:String
    var done:Bool
    
    public init(quantity:String, desc: String) {
        self.quantity = quantity
        self.desc = desc
        self.done = false
    }
}

extension shoppingList {
    public class func loadSampleData() -> [shoppingList] {
        return [
            shoppingList(quantity: "1x ", desc: "Milk"),
            shoppingList(quantity: "3x ", desc: "Banana"),
            shoppingList(quantity: "2x ", desc: "Bread")
        ]
    }
}
