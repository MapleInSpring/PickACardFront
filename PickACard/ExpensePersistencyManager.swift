//
//  ExpensePersistencyManager.swift
//  PickACard
//
//  Created by Yifeng Hou on 29/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit

class ExpensePersistencyManager: NSObject {
    private var expenses = [Expense]()
    
    override init() {
        let expense1 = Expense(expense: 10, location: "466506")
        let expense2 = Expense(expense: 20, location: "466507")
        let expense3 = Expense(expense: 30, location: "bugis, for savings")
        let expense4 = Expense(expense: 40, location: "ocbc, for savings")
        
        expenses = [expense1, expense2, expense3, expense4]
    }
    
    func getExpenses() -> [Expense] {
        return expenses
    }
    
    func addExpense(expense: Expense) {
//        if (expenses.count >= index) {
//            expenses.insert(expense, atIndex: index)
//        } else {
            expenses.append(expense)
//        }
    }
    
    func deleteExpenseAtIndex(index: Int) {
        expenses.removeAtIndex(index)
    }
}
