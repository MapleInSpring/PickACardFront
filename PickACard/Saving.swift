//
//  Saving.swift
//  PickACard
//
//  Created by Yifeng Hou on 5/6/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation

class Saving: NSObject {
    let amount : Double
    let cardName : String
    var savingDetails : [SavingDetail]
    
    init(amount: Double, cardName: String) {
        self.amount = amount
        self.cardName = cardName
        self.savingDetails = []
    }
}
