//
//  Home.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI

struct Home: View {
    @StateObject var vm = AzkarViewModel()
    
    @State var offset:CGFloat = 0
    @State var startOffset:CGFloat = 0
    @State var titleOffset:CGFloat = 0
    @State var titleBarHeight:CGFloat = 0
    //    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack(alignment:.top) {
            //moving search bar if user start type...
            
            VStack {
                
                if vm.search == "" {
                    HStack{
//
//                        Button(action: {}, label: {
//                            Image(systemName: "star")
//                                .font(.title2)
//                                .foregroundColor(.primary)
//
//
//                        })
//
//                        Spacer()
//
//                        Button(action: {}, label: {
//                            Image(systemName: "plus")
//                                .font(.title2)
//                                .foregroundColor(.primary)
//
//                        })
                    }
                    .padding()
                    
                    HStack {
                        
                        (
                            Text("AZ ")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                +
                                Text("kAR ")
                                .foregroundColor(.gray)
                        )
                        .font(.largeTitle)
                        .overlay(
                            
                            GeometryReader{reader ->Color in
                                
                                let minY = reader.frame(in: .global).maxX
                                
                                DispatchQueue.main.async {
                                    
                                    if titleOffset == 0 {titleOffset=minY}
                                    
                                }
                                //                        print(minY)
                                
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                        )
                        .padding()
                        .scaleEffect(getScale())
                        .offset(getOffets())
                        
                        
                        Spacer()
                    }
                }
                
                
                //search bar
                
                VStack {
                    HStack(spacing:15) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.gray)
                        
                        TextField("Search...",text:$vm.search)
                            .onChange(of: vm.search) { (value) in
                                
                                vm.makeSearchOperation()
                            
                            }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.05))
                    .cornerRadius(8)
                    .padding()
                    
                    //divider line
                    if vm.search == "" {
                        HStack{
                            
                            Text("Alls")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:0.5)
                        }
                        .padding()
                    }
                    
                }
                .offset(y: offset > 0 && vm.search == "" ? (offset <= 95 ? -offset : -95) : 0)
                
            }
            .zIndex(1)
            //padding bottom
            //to decrease height of the view
            .padding(.bottom,vm.search == "" ? getOffets().height : 0)
            .background(
                
                ZStack {
                    
                    let color =  Color.white
                    
                    LinearGradient(gradient: .init(colors: [color,color,color,color,color.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    
                }
                .ignoresSafeArea()
            )
            .overlay(
                
                GeometryReader{reader ->Color in
                    
                    let minY = reader.frame(in: .global).maxY
                    
                    DispatchQueue.main.async {
                        
                        if titleBarHeight == 0 {
                            titleBarHeight = minY - (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        }
                        //                        if titleBarHeight == 0 {titleBarHeight=minY}
                        
                    }
                    //                        print(minY)
                    
                    return Color.clear
                }
                //                .frame(width: 0, height: 0)
            )
            //animate only when start type
            .animation(.easeOut,value: vm.search != "")
            
//            if vm.filterListOfAllAzakar.isEmpty{
//
//                // loading View...
//
//
//                Text("no data found!")
////                NoSearchResult()
////                    .frame(height:UIScreen.main.bounds.height/4)
//
//            }
//
//            else{
                
            
            ScrollView{
                
                VStack(spacing:15) {
                    
                    ForEach(vm.filterListOfAllAzakar,id:\.self) {t in
                        AzarRowView(xx:t)
                    }
                    //                            ForEach(searchQuery != "" ? friends.filter{$0.name.lowercased().contains(searchQuery.lowercased())} : friends) {f in
                    //                                FriendRowVivew(friend:f)
                    //
                    //                            }
                    
                }
                .padding(.top,10)
                .padding(.top,vm.search == "" ? titleBarHeight : 90)
                //get offset using greader
                
                .overlay(
                    
                    GeometryReader{proxy ->Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            
                            if startOffset == 0 {startOffset=minY}
                            
                            offset = startOffset-minY
                            
                            print(offset)
                        }
                        //                        print(minY)
                        
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)
                    ,alignment: .top)
            }
//            }
        }
    }
    
    func getOffets() -> CGSize {
        var size:CGSize = .zero
        let screenWidth = UIScreen.main.bounds.width / 2
        let ww = (offset*1.5) <= (screenWidth-titleOffset) ? offset*1.5 : (screenWidth-titleOffset)
        
        //width is slow moving were muliply with 1.5
        size.width = offset > 0 ? ww : 0
        size.height = offset > 0 ? (offset <= 75 ?  -offset : -75) : 0
        return size
    }
    
    //little bit shrinking tilte when scrolling
    
    func getScale() -> CGFloat {
        
        if offset > 0  {
            let screenWidth = UIScreen.main.bounds.width
            let progress = 1 - (getOffets().width / screenWidth)
            
            return progress >= 0.9 ? progress : 0.9
        }
        else {
            return 1
        }
        
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
