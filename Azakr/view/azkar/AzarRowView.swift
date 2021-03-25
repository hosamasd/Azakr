//
//  AzarRowView.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI

struct AzarRowView: View {
    var xx:String = "hosam"
    
    var body: some View {
        
        Text(xx)
            .font(.title3)
            .fontWeight(.bold)
            
            .padding()
            .multilineTextAlignment(.center)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.green.opacity(0.6),lineWidth: 3)
                    //                       .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            )
            .padding()
        
    }
}

struct AzarRowView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
