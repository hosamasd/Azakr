//
//  DetailAZ.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI

struct DetailAZ: View {
    
  @State  var azkars:[AzkarModek] = [
        
//        .init(category: "", count: "2", descriptionField:"مائة حسنة، ومُحيت عنه مائة سيئة، وكانت له حرزاً من الشيطان حتى يمسى." , reference: "البخاري", zekr: "أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ"),
        
//        .init(category: "", count: "2", descriptionField: "حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ. لَمْ يَأْتِ أَحَدٌ يَوْمَ الْقِيَامَةِ بِأَفْضَلَ مِمَّا جَاءَ بِهِ إِلَّا أَحَدٌ قَالَ مِثْلَ مَا قَالَ أَوْ زَادَ عَلَيْهِ.", reference: "مسلم", zekr: "سُبْحـانَ اللهِ وَبِحَمْـدِهِ.")
    ]
    var xxx:String = ""
    
    var animation: Namespace.ID
    @Binding var show:Bool
    @StateObject var vm = AzkarViewModel()
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HStack{
                
                Button(action: {
                                        withAnimation{show.toggle()}
                }, label: {
                    
                    
                    
                    Image(systemName:"chevron.backward")
                        .renderingMode(.original)
                        .font(.system(size: 35))
                })
                
                Spacer(minLength: 0)
                
                Text(xxx)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    //                    withAnimation{down.toggle()}
                }, label: {
                    
                    
                    
                    Image(systemName:"bookmark")
                        .renderingMode(.original)
                        .font(.system(size: 35))
                })
                
            }
            .padding()
            // since top edge is ignored....
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white.shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)
            
            // Scaling Effect....
            
            
            ScrollView(showsIndicators:false){
                
                VStack(spacing: 15){
                    
                    // setting name as id...
                    
                    ForEach(azkars){album in
                        
                        
                        DetailRowView(x: album)
                            .padding()
                        //                                AlbumView(album: album)
                        //                                    // scaling effect from bottom....
                        
                    }
                }
                .padding(.top,25)
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: {
            self.azkars =    vm.getData(ss: xxx)
        })
    }
    
    // Simple Calculation for scaling Effect...
    
    func scaleValue(mainFrame : CGFloat,minY : CGFloat)-> CGFloat{
        
        // adding animation...
        
        withAnimation(.easeOut){
            
            // reducing top padding value...
            
            let scale = (minY - 25) / mainFrame
            
            // retuning scaling value to Album View if its less than 1...
            
            if scale > 1{
                
                return 1
            }
            else{
                
                return scale
            }
        }
    }
}
