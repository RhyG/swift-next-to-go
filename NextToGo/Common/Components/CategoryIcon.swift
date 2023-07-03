//
//  CategoryIcon.swift
//  NextToGo
//
//  Created by Rhys Geary on 25/6/2023.
//

import SwiftUI

struct CategoryIcon: View {
    var categoryId: String
    
    var iconName: String {
        Constants.CategoryID(rawValue: categoryId)?.icon ?? "icon-horse"
    }
    
    var body: some View {
        Image(iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 35)
    }
}

struct CategoryIcon_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIcon(categoryId: Constants.CategoryID.horse.rawValue)
    }
}
