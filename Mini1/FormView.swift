//
//  FormView.swift
//  Mini1
//
//  Created by Jonathan Aaron Wibawa on 30/03/24.
//

import SwiftUI

enum FormType: String, CaseIterable {
    case manual = "Aa Manual"
    case scan = "Scan"
}

struct FormView: View {
    
    @State private var selectedFormType = FormType.manual
    @State private var selectedCategory: BudgetCategory?
    @State private var amount: Double = 0
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("lightYellow"))
                .ignoresSafeArea(.all)
            
            ScrollView{
                
            }
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("darkBlue"))
                        .frame(height: geometry.size.height / 1.3)
                        .overlay(
                            VStack{
                                HStack{
                                    Text("Add")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button{
                                        amount = 0
                                        selectedCategory = nil
                                    }label: {
                                        Image(systemName: "x.circle.fill")
                                            .resizable()
                                            .foregroundColor(.gray)
                                            .frame(width: 25, height: 25)
                                    }
                                }
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                
                                
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.white)
                                    .frame(width: .infinity, height: 420)
                                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 20, trailing: 0))
                                    .overlay(
                                        VStack{
                                            
                                            Picker("Select Type", selection: $selectedFormType) {
                                                ForEach(FormType.allCases, id: \.rawValue) {type in
                                                    Text(type.rawValue).tag(type)
                                                }
                                            }
                                            .pickerStyle(.segmented)
                                            .frame(width: 200)
                                            
                                            ManualForm(amount: $amount)
                                            
                                            Picker("Budget Category", selection: $selectedCategory) {
                                                Text("Select Category").tag(nil as BudgetCategory?)
                                                ForEach(BudgetCategory.allCases, id: \.self) { category in
                                                    Text(category.rawValue).tag(category as BudgetCategory?)
                                                }
                                            }
                                            
                                            Button{
                                                print(amount, selectedCategory?.rawValue ?? "")
                                            } label: {
                                                RoundedRectangle(cornerRadius: 25)
                                                    .frame(width: 200, height: 50)
                                                    .overlay(
                                                        Text("Save")
                                                            .foregroundColor(.white)
                                                            .fontWeight(.bold)
                                                    )
                                            }
                                            .padding(.vertical, 20)
                                            
                                            
                                            Spacer()
                                        }
                                            .padding(EdgeInsets(top: 80, leading: 20, bottom: 20, trailing: 20))
                                    )
                                
                                Spacer()
                            }
                            .padding(30)
                        )
                }
            }
            
            Text("💸")
                .font(.system(size: 170))
                .padding(EdgeInsets(top: -320, leading: 0, bottom: 0, trailing: 0))
        }
    }
}


#Preview {
    FormView()
}




struct ManualForm: View {
    
    @Binding var amount: Double
    
    var body: some View {
        TextField(
            "Amount IDR",
            text: Binding<String>(
                get: {
                    formatCurrency(amount)
                },
                set: { newValue in
                    if let value = numberFormatter.number(from: newValue)?.doubleValue {
                        amount = value
                    }
                }
            )
        )
        
        .padding()
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .border(Color(UIColor.separator))
    }
}
