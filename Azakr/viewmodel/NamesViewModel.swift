//
//  NamesViewModel.swift
//  Azakr
//
//  Created by hosam on 3/26/21.
//

import SwiftUI

class NamesViewModel: ObservableObject {
    @Published var allNames:[NamesModel] = [NamesModel]()
    @Published   var gradients : [Gradient] = []
    @Published   var first   = 0
    @Published   var ssss   = [[String]]()
    //    @Published var allNames:[String] = [String]()
    init() {
        allNames = Bundle.main.decodeS("names_of_allah.json")
        getColors()
    }
    
    
    func getColors(){
        
        // Loading JSON Data....
        
        let url = "https://raw.githubusercontent.com/ghosh/uiGradients/master/gradients.json"
        
        let seesion = URLSession(configuration: .default)
        
        seesion.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let jsonData = data else{return}
            
            do{
                
                // decoding Json...
                
                let colors = try JSONDecoder().decode([Gradient].self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.gradients = colors
                    self.ssss=colors.map{$0.colors}
                    
                    //                    colors.forEach { (g) in
                    //                        self.ssss.append(contentsOf: g.colors)
                    //                    }
                    
                    
                    //                    self.filtered = colors
                }
                
            }
            catch{
                
                print(error)
            }
        }
        .resume()
    }
    
    // Converting HEX Number To UICOlor.....
    
    func HEXTORGB(colors: [String])->[Color]{
        
        var colors1 : [Color] = []
        
        for color in colors{
            
            // removing #...
            
            var trimmed = color.trimmingCharacters(in: .whitespaces).uppercased()
            
            trimmed.remove(at: trimmed.startIndex)
            
            var hexValue : UInt64 = 0
            Scanner(string: trimmed).scanHexInt64(&hexValue)
            
            let r = CGFloat((hexValue & 0x00FF0000) >> 16) / 255
            let g = CGFloat((hexValue & 0x0000FF00) >> 8) / 255
            let b = CGFloat((hexValue & 0x000000FF)) / 255
            
            colors1.append(Color(UIColor(red: r, green: g, blue: b, alpha: 1.0)))
        }
        
        return colors1
    }
    
    func getData() -> [String] {
        if !gradients.isEmpty {
            
            return ssss.randomElement() ?? ["#2196f3", "#f44336"]
        }
        else {
            return ["#2196f3", "#f44336"]
        }
        
    }
}
