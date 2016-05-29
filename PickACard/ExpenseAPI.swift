//
//  ExpenseAPI.swift
//  PickACard
//
//  Created by Yifeng Hou on 29/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit

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
    }
    
    func deleteExpense(index: Int) {
        pm.deleteExpenseAtIndex(index)
    }
}


