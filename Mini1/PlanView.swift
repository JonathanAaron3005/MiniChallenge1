//
//  PlanView.swift
//  Mini1
//
//  Created by Jonathan Aaron Wibawa on 03/04/24.
//

import SwiftUI
import Charts

struct PlanView: View {
    
    @State private var selectedOverviewType = ReportType.monthly
    @State private var selectedCategory1: BudgetCategory?
    @State private var selectedCategory2: BudgetCategory?
    @State private var budget = 50.0
    @State private var isEditing = false
    @State private var limit = 50.0
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("lightYellow"))
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack{
                    HStack {
                        Text("Planning")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.3)
                        .padding(.vertical, -5)
                    
                    HStack {
                        Text("Budget Plan")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                    
                    SectorChartExample()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.orange, lineWidth: 1)
                        .fill(.clear)
                        .frame(width: .infinity, height: 50)
                        .overlay(
                            Picker("Budget Category", selection: $selectedCategory1) {
                                Text("Select Category").tag(nil as BudgetCategory?)
                                ForEach(BudgetCategory.allCases, id: \.self) { category in
                                    Text(category.rawValue).tag(category as BudgetCategory?)
                                }
                            }
                        )
                        .padding(.vertical, 20)
                    
                    VStack {
                        HStack {
                            Text("Set Budget")
                                .font(.system(size: 15, weight: .light))
                            Spacer()
                        }
                        CustomSlider(value: $budget, isEditing: $isEditing)
                    }
                    
                    VStack {
                        HStack {
                            Text("My Reminder")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.orange, lineWidth: 1)
                            .fill(.clear)
                            .frame(width: .infinity, height: 50)
                            .overlay(
                                Picker("Budget Category", selection: $selectedCategory2) {
                                    Text("All Category").tag(nil as BudgetCategory?)
                                    ForEach(BudgetCategory.allCases, id: \.self) { category in
                                        Text(category.rawValue).tag(category as BudgetCategory?)
                                    }
                                }
                            )
                            .padding(.vertical, 20)
                        HStack {
                            Text("Set Limit")
                                .font(.system(size: 15, weight: .light))
                            Spacer()
                            Picker("Select Time", selection: $selectedOverviewType){
                                ForEach(ReportType.allCases, id: \.rawValue){ type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                            .frame(width: 150)
                        }
                        CustomSlider(value: $limit, isEditing: $isEditing)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    PlanView()
}

struct SectorChartExample: View {
    
    var body: some View {
        Chart(budgetData.categories) { c in
            SectorMark(
                angle: .value(
                    Text(verbatim: c.category.rawValue),
                    c.monthlyBudget
                ),
                innerRadius: .ratio(0.6)
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: c.category.rawValue),
                    c.category.rawValue
                )
            )
        }
        .frame(width: 250, height: 250)
    }
}

struct CustomSlider: View {
    
    @Binding var value: Double
    @Binding var isEditing: Bool
    
    var body: some View {
        Slider(
            value: $value,
            in: 0...100,
            step: 5
        ) {
            Text("Speed")
        } minimumValueLabel: {
            Text("0%")
        } maximumValueLabel: {
            Text("100%")
        } onEditingChanged: { editing in
            isEditing = editing
        }
        Text("\(String(format: "%.f", value))%")
            .foregroundColor(isEditing ? .red : .blue)
    }
}
