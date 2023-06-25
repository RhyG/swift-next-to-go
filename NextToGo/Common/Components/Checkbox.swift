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
//    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: isChecked ? "square.fill" : "square")
                CategoryIcon(categoryId: categoryId.rawValue)
            }
        }
        .foregroundColor(.brandPrimary)
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            //            Checkbox(isChecked: .constant(true), icon: "icon-horse")
            //                    .previewLayout(.sizeThatFits)
            //                    .padding()
            //
            //                Checkbox(isChecked: .constant(false), icon: "icon-harness")
            //                    .previewLayout(.sizeThatFits)
            //                    .padding()
            //            }
            Text("WOW")
        }
    }
}
