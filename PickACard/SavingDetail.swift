//
//  SavingDetail.swift
//  PickACard
//
//  Created by Yifeng Hou on 5/6/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation

class SavingDetail: NSObject {
    let expenseAmount : Double
    let savedAmount : Double
    let location : String
    let postalcode : Int
    let promotionDetails : String
    
    init(expenseAmount: Double, savedAmount: Double, location: String, postalcode: Int, promotionDetails: String) {
        self.expenseAmount = expenseAmount
        self.savedAmount = savedAmount
        self.location = location
        self.postalcode = postalcode
        self.promotionDetails = promotionDetails
    }

}