//
//  FormView.swift
//  Mini1
//
//  Created by Jonathan Aaron Wibawa on 30/03/24.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("darkBlue"))
                        .frame(height: geometry.size.height / 1.4)
                }
                .ignoresSafeArea(.all)
            }
            
            Text("💸")
                .font(.system(size: 170))
                .padding(EdgeInsets(top: -230, leading: 0, bottom: 0, trailing: 0))
        }
    }
}


#Preview {
    FormView()
}



