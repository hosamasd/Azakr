//
//  NoSearchResult.swift
//  Error_Pages
//
//  Created by Abu Anwar MD Abdullah on 12/1/21.
//

import SwiftUI

struct NoSearchResult: View {
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Image(uiImage: #imageLiteral(resourceName: "14_No Search Results"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:200)
//                .edgesIgnoringSafeArea(.all)
           
//            VStack (alignment: .leading, spacing: 30) {
//                
//                Text("No Results")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
////                    .padding(.top,120)
//                
//                Text("Sorry, there are no results for \nthis search, Please try another phrase...")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .opacity(0.7)
//                
//                   
//                    
//            }
//            .padding(.horizontal, 70)
//            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
        }
//        .frame(height:UIScreen.main.bounds.height/8)
    }
}

struct NoSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        NoSearchResult()
    }
}
