//
//  CategoryButton.swift
//  Mini1
//
//  Created by Leonardo Marhan on 14/04/24.
//

import SwiftUI

struct CategoryButton:View {
    var icon:String
    var name:String
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .frame(width: 50)
                    .foregroundColor(Color("lightYellow"))
                Text(icon)
                    .font(.largeTitle)
            }
            Text(name)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
