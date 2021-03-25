//
//  DetailRowView.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI

struct DetailRowView: View {
    var x = AzkarModek(category: "", count: "2", descriptionField:"مائة حسنة، ومُحيت عنه مائة سيئة، وكانت له حرزاً من الشيطان حتى يمسى." , reference: "البخاري", zekr: "أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ")
    var body: some View {
        
        VStack(spacing:20) {
            
            Text(x.zekr ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
                .lineLimit(20)
            
            if x.descriptionField != "" {
            
            Text(x.descriptionField ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(20)
            
            }
            
            if x.count != "" {
            HStack(spacing:20) {
                
                ZStack {
                    
                    Text(x.count ?? "0")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top,20)
            }
        }
        .padding()
        .frame(width:UIScreen.main.bounds.width-32)
        .background(Color.white)
        .clipShape(Corners())
        
        
    }
}
