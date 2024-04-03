//
//  BudgetModel.swift
//  Mini1
//
//  Created by Jonathan Aaron Wibawa on 02/04/24.
//

import Foundation

struct BudgetModel {
    var monthlyBudget, weeklyBudget: Double
    var expense = 300000.0
    var weeklyExpense = 100000.0
    
    var categories: [CategoryBudget]
    
    init(monthlyBudget: Double, categories: [CategoryBudget]) {
        self.monthlyBudget = monthlyBudget
        self.weeklyBudget = monthlyBudget/4
        self.categories = categories
    }
    
    static func createDummyData() -> BudgetModel {
        let monthlyBudget = 3000000.0
        let data =
            BudgetModel(monthlyBudget: monthlyBudget, categories: [
                CategoryBudget(category: .food, allocation: 0.3, total: monthlyBudget, icon: "🍔"),
                CategoryBudget(category: .transport, allocation: 0.3, total: monthlyBudget, icon: "🚀"),
                CategoryBudget(category: .entertainment, allocation: 0.3, total: monthlyBudget, icon: "🎳"),
                CategoryBudget(category: .skincare, allocation: 0.1, total: monthlyBudget, icon: "🤩"),
                CategoryBudget(category: .pet, allocation: 0.2, total: monthlyBudget, icon: "😸")
        ])
        
        return data
    }
    
    mutating func spend(category: BudgetCategory, amount: Double) {
        expense += amount
    }
}

enum BudgetCategory: String, CaseIterable {
    case food = "Food" //0.3
    case transport = "Transport" //0.3
    case entertainment = "Entertainment" //0.2
    case pet = "Pet" //0.2
    case skincare = "Skincare" //0.2
}

struct CategoryBudget : Identifiable{
    var id = UUID()
    var category: BudgetCategory
    var total, monthlyBudget, weeklyBudget: Double
    var expense = 100000.0
    var weeklyExpense = 75000.0
    var allocation: Double
    var icon: String
    
    init(category: BudgetCategory, allocation: Double, total: Double, icon: String) {
        self.category = category
        self.allocation = allocation
        self.monthlyBudget = total * allocation
        self.weeklyBudget = monthlyBudget/4
        self.total = total
        self.icon = icon
    }
}




