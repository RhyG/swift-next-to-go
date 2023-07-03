//
//  Checkbox.swift
//  NextToGo
//
//  Created by Rhys Geary on 24/6/2023.
//

import SwiftUI

struct Checkbox: View {
    var isChecked: Bool
    var categoryId: Constants.CategoryID
 
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: isChecked ? "square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                CategoryIcon(categoryId: categoryId.rawValue)
            }
        }
        .foregroundColor(.brandPrimary)
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("WOW")
        }
    }
}
