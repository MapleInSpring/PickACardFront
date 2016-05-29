//
//  Expense.swift
//  PickACard
//
//  Created by Yifeng Hou on 21/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation

class Expense: NSObject {
    let expense : Double
    let location : String
    
    init(expense: Double, location: String) {
        self.expense = expense
        self.location = location
    }
}