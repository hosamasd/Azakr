//
//  HomeNames.swift
//  Azakr
//
//  Created by hosam on 3/26/21.
//

import SwiftUI

struct HomeNames: View {
    
    @StateObject var vm = NamesViewModel()
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    @State var index = 3
    @Namespace var animation

    var body: some View {
        VStack(spacing: 0){
            
            HStack{
                
                
                
                Spacer(minLength: 0)
                
                Text("Names Of Allah")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                
                
            }
            .padding()
            // since top edge is ignored....
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white.shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)
            
            // Custom Picker....
            HStack{
                
                CustomText(index: $index, namespace: animation)
                    .onTapGesture {
                        reorderView(f: 1)
                    }
                
                CustomText(index: $index, namespace: animation,name: 2)
                    .onTapGesture {
                        reorderView(f: 2)
                    }
                
                CustomText(index: $index, namespace: animation,name: 3)
                    .onTapGesture {
                        reorderView(f: 3)
                    }
                
                CustomText(index: $index, namespace: animation,name: 4)
                    .onTapGesture {
                        reorderView(f: 4)
                    }
                
            }
            .background(Color.black.opacity(0.15))
            .cornerRadius(15)
            .padding(.top)
            
            // Vstack Bug..
            
            if vm.gradients.isEmpty{
                
                // loading View...
                ProgressView()
                    .padding(.top,55)
                
                Spacer()
            }
            
            else{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    LazyVGrid(columns: columns,spacing: 20){
                        
                        // assigning name as ID...
                        
                        ForEach(vm.allNames,id:\.self){ string in
                            
                            NamesRowView(columns: $columns, gradient: vm.getData(), ss: string.name, vm: vm)
                       
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .zIndex(0)
                .padding(.top,20)
                
            }
            
            Spacer()
        }
        
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
    
    func reorderView(f:Int)  {
        columns.removeAll()
        
        withAnimation(.easeOut){
            index=f
            for _ in 0..<f {
                columns.append(GridItem(.flexible(), spacing: 20))
            }
            
            
        }
    }
 
}

struct HomeNames_Previews: PreviewProvider {
    static var previews: some View {
        HomeNames()
    }
}
