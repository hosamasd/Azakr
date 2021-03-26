//
//  NamesRowView.swift
//  Azakr
//
//  Created by hosam on 3/26/21.
//

import SwiftUI

struct NamesRowView: View {
    
    @Binding var columns:[GridItem]
    var gradient:[String]
    var ss:String
    var vm:NamesViewModel
    
    var body: some View {
        VStack(spacing: 15){
            
            ZStack{
                
                LinearGradient(gradient: .init(colors: vm.HEXTORGB(colors: gradient)), startPoint: .top, endPoint: .bottom)
                    .frame(height: 180)
                    .clipShape(CShape(corners: [.topRight,.bottomLeft]))
                    .cornerRadius(15)
                // context Menu...
                    .contentShape(CShape(corners: [.topRight,.bottomLeft]))
                 
                
                Text(ss)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
                
//            if columns.count == 1{
//
//                HStack(spacing: 15){
//
//                    ForEach(gradient,id: \.self){color in
//
//                        Text(ss)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    }
//                }
//            }
        }
    }
}
