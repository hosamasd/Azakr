//
//  CustomText.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct CustomText: View {
    
    @Binding var index:Int
    let namespace: Namespace.ID
    var name = 1
    
    var body: some View {
        
        Text("\(name)")
            .frame(width: 35, height: 35)
            .background(RoundedRectangle(cornerRadius: 8).stroke(index == name ? Color.black : Color.white,lineWidth: 3))
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(index == name ? .black : .white)
            .frame(width: 80, height: 45)
            .background(
            
                ZStack{
                    if index != name{
                        Color.clear
                    }
                    else{
                        Color.white
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "Tab", in: namespace)
                    }
                }
            )
           
    }
}
