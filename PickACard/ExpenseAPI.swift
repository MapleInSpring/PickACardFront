//
//  ExpenseAPI.swift
//  PickACard
//
//  Created by Yifeng Hou on 29/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit
import Alamofire

class ExpenseAPI: NSObject {
    private let pm: ExpensePersistencyManager
    
    override init() {
        pm = ExpensePersistencyManager()
        super.init()
    }
    
    class var sharedInstance: ExpenseAPI {
        struct Singleton {
            static let instance = ExpenseAPI()
        }
        return Singleton.instance
    }
    
    func getExpenses() -> [Expense] {
        return pm.getExpenses()
    }
    
    func addExpense(expense: Expense) {
        pm.addExpense(expense)
        let parameters =
        [
            "expense": [
                "amount": expense.expense,
                "location": expense.location
            ]
        ]
//        Alamofire.request(.POST, "http://pickacardbackendv2.cfapps.io/add_expense", parameters: parameters as? [String : AnyObject])
        Alamofire.request(.POST, "http://localhost:3000/add_expense", parameters: parameters)

    }
    
    func deleteExpense(index: Int) {
        pm.deleteExpenseAtIndex(index)
    }
}


