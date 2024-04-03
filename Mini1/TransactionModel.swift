//
//  TransactionModel.swift
//  Mini1
//
//  Created by Jonathan Aaron Wibawa on 02/04/24.
//

import Foundation

struct TransactionModel: Identifiable {
    let id = UUID()
    var status: String
    var date: Date
    var amount: Double

    init(status: String, day: Int, amount: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.status = status
        self.date = calendar.date(from: DateComponents(year: 2023, month: 1, day: day))!
        self.amount = amount
    }
    
    static func createDummyData() -> [TransactionModel] {
        let data = [
            TransactionModel(status: "Expense", day: 1, amount: 74),
            TransactionModel(status: "Expense", day: 2, amount: 174),
            TransactionModel(status: "Expense", day: 3, amount: 44),
            TransactionModel(status: "Expense", day: 4, amount: 54),
            TransactionModel(status: "Expense", day: 5, amount: 64),
            TransactionModel(status: "Expense", day: 6, amount: 74),
            TransactionModel(status: "Expense", day: 7, amount: 134),
            TransactionModel(status: "Expense", day: 8, amount: 50),
            TransactionModel(status: "Expense", day: 9, amount: 214),
            TransactionModel(status: "Expense", day: 10, amount: 200),
            TransactionModel(status: "Expense", day: 11, amount: 133),
            TransactionModel(status: "Expense", day: 12, amount: 134),
            TransactionModel(status: "Expense", day: 13, amount: 200),
            TransactionModel(status: "Expense", day: 14, amount: 300),
            TransactionModel(status: "Expense", day: 15, amount: 374),
            TransactionModel(status: "Expense", day: 16, amount: 274),
            TransactionModel(status: "Expense", day: 17, amount: 123),
            TransactionModel(status: "Expense", day: 18, amount: 343),
            TransactionModel(status: "Expense", day: 19, amount: 144),
            TransactionModel(status: "Expense", day: 20, amount: 256),
            TransactionModel(status: "Expense", day: 21, amount: 188),
            TransactionModel(status: "Expense", day: 22, amount: 123),
            TransactionModel(status: "Expense", day: 23, amount: 321),
            TransactionModel(status: "Expense", day: 24, amount: 213),
            TransactionModel(status: "Expense", day: 25, amount: 111),
            TransactionModel(status: "Expense", day: 26, amount: 222),
            TransactionModel(status: "Expense", day: 27, amount: 233),
            TransactionModel(status: "Expense", day: 28, amount: 231),
            TransactionModel(status: "Expense", day: 29, amount: 124),
            TransactionModel(status: "Expense", day: 30, amount: 111),
            
            TransactionModel(status: "Income", day: 1, amount: 374),
            TransactionModel(status: "Income", day: 2, amount: 174),
            TransactionModel(status: "Income", day: 3, amount: 454),
            TransactionModel(status: "Income", day: 4, amount: 114),
            TransactionModel(status: "Income", day: 5, amount: 90),
            TransactionModel(status: "Income", day: 6, amount: 274),
            TransactionModel(status: "Income", day: 7, amount: 234),
            TransactionModel(status: "Income", day: 8, amount: 230),
            TransactionModel(status: "Income", day: 9, amount: 214),
            TransactionModel(status: "Income", day: 10, amount: 290),
            TransactionModel(status: "Income", day: 11, amount: 125),
            TransactionModel(status: "Income", day: 12, amount: 334),
            TransactionModel(status: "Income", day: 13, amount: 300),
            TransactionModel(status: "Income", day: 14, amount: 174),
            TransactionModel(status: "Income", day: 15, amount: 174),
            TransactionModel(status: "Income", day: 16, amount: 224),
            TransactionModel(status: "Income", day: 17, amount: 123),
            TransactionModel(status: "Income", day: 18, amount: 300),
            TransactionModel(status: "Income", day: 19, amount: 374),
            TransactionModel(status: "Income", day: 20, amount: 234),
            TransactionModel(status: "Income", day: 21, amount: 146),
            TransactionModel(status: "Income", day: 22, amount: 174),
            TransactionModel(status: "Income", day: 23, amount: 230),
            TransactionModel(status: "Income", day: 24, amount: 320),
            TransactionModel(status: "Income", day: 25, amount: 120),
            TransactionModel(status: "Income", day: 26, amount: 174),
            TransactionModel(status: "Income", day: 27, amount: 274),
            TransactionModel(status: "Income", day: 28, amount: 374),
            TransactionModel(status: "Income", day: 29, amount: 454),
            TransactionModel(status: "Income", day: 30, amount: 374),
        ]
        
        return data
    }
}
