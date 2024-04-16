//
//  ScanView.swift
//  Mini1
//
//  Created by Leonardo Marhan on 14/04/24.
//

import SwiftUI

struct ScanView:View {
    @State private var selectedOption: Int?
    @State private var selectedOptions = Array(repeating: false, count: 4)
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("lightYellow"))
                .ignoresSafeArea(.all)
            
            GeometryReader{ geometry in
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("darkBlue"))
                        .frame(height: geometry.size.height / 1.2)
                        .overlay(
                            VStack{
                                Text("Scanned Document")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .bold()
                                HStack{
                                    Text("Recognized items")
                                        .font(.title2)
                                        .foregroundColor(.yellow)
                                        .bold()
                                    Spacer()
                                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                HStack{
                                    Text("Group the items according to your categories")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                HStack{
                                    CategoryButton(isSelected: selectedOption == 0, action: {
                                        self.selectedOption = 0
                                    }, icon: "🍔", name: "Food")
                                    Spacer()
                                    CategoryButton(isSelected: selectedOption == 1, action: {
                                        self.selectedOption = 1
                                    }, icon: "🚆", name: "Transportation")
                                    Spacer()
                                    CategoryButton(isSelected: selectedOption == 2, action: {
                                        self.selectedOption = 2
                                    }, icon: "🎮", name: "Entertainment")
                                    Spacer()
                                    CategoryButton(isSelected: selectedOption == 3, action: {
                                        self.selectedOption = 3
                                    }, icon: "🐱", name: "Pet")
                                }
                                
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color("lightYellow"))
                                    .overlay(
                                        VStack{
                                            HStack{
                                                VStack{
                                                    ForEach(0..<selectedOptions.count, id: \.self) { index in
                                                        RadioButton(isSelected: self.selectedOptions[index]) {
                                                            self.selectedOptions[index].toggle()
                                                        }
                                                    Spacer()
                                                    }
                                                }
                                                VStack{
                                                    TransactionDetail(date: "01/04", price: "Rp 10.000,00", desc: "Bank Administration", method: "DB OTOMATIS")
                                                    TransactionDetail(date: "01/04", price: "Rp 100.000,00", desc: "Kartu Parkir", method: "DB OTOMATIS")
                                                    TransactionDetail(date: "29/03", price: "Rp 26.000,00", desc: "DUM DUM THE BREEZE", method: "QRIS")
                                                    TransactionDetail(date: "29/03", price: "Rp 50.000,00", desc: "XXI THE BREEZE", method: "QRIS")
                                                }
                                            }
                                            RoundedRectangle(cornerRadius: 25)
                                                .frame(width: 120, height: 40)
                                                .foregroundColor(.yellow)
                                                .overlay(
                                                    Text("Save")
                                                        .fontWeight(.bold)
                                                )
                                        }.padding(25)
                                        
                                    )
                                Spacer()
                            }.padding(30)
                        )
                }
            }
        }
    }
}

struct CategoryButton:View {
    var isSelected: Bool
    var action: () -> Void
    var icon:String
    var name:String
    
    var body: some View{
        VStack{
            ZStack{
                Button(action: action){
                    ZStack{
                        Circle()
                            .frame(width: 50)
                            .foregroundColor(Color("lightYellow"))
                        Text(icon)
                            .font(.largeTitle)
                        
                        if isSelected {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color.yellow)
                            Text(icon)
                                .font(.largeTitle)
                        }
                    }
                }
                
            }
            Text(name)
                .font(.caption)
                .foregroundColor(.gray)
        }.frame(width: 90)
    }
}

struct TransactionDetail:View {
    var date:String
    var price:String
    var desc:String
    var method:String
    var body: some View{
        HStack{
            Text(date)
                .font(.headline)
            Spacer()
            Text(price)
                .font(.headline)
                .foregroundColor(.red)
        }
        HStack{
            Text(desc)
                .font(.subheadline)
            Spacer()
        }
        HStack{
            Text(method)
                .font(.subheadline)
            Spacer()
        }
        Spacer()
    }
}

struct RadioButton: View {
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 30)
                    .foregroundColor(.white)
                
                if isSelected {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 30)
                }
            }
        }
    }
}

#Preview {
    ScanView()
}
