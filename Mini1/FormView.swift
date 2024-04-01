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
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("darkBlue"))
                .frame(height: 500)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -400, trailing: 0))
            Text("💸")
                .font(.system(size: 150))
                .padding(EdgeInsets(top: -150, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    FormView()
}
