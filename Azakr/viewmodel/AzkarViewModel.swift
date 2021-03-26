//
//  AzkarViewModel.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI


class AzkarViewModel: ObservableObject {
    
    @Published var totalAzakar:[AzkarModek] = []
    @Published var elsabahAzakar:[AzkarModek] = []
    @Published var elmassaAzakar:[AzkarModek] = []
    @Published var sleep:[AzkarModek] = []
    
    @Published var clothes:[AzkarModek] = []
    @Published var s_5:[AzkarModek] = []
    @Published var s_6:[AzkarModek] = []
    @Published var s_7:[AzkarModek] = []
    @Published var s_8:[AzkarModek] = []
    @Published var s_9:[AzkarModek] = []
    @Published var s_10:[AzkarModek] = []
    @Published var s_11:[AzkarModek] = []
    @Published var s_12:[AzkarModek] = []
    @Published var s_13:[AzkarModek] = []
    @Published var s_14:[AzkarModek] = []
    @Published var s_15:[AzkarModek] = []
    @Published var s_16:[AzkarModek] = []
    @Published var s_17:[AzkarModek] = []
    @Published var s_18:[AzkarModek] = []
    @Published var s_19:[AzkarModek] = []
    @Published var listOfAllAzakar=[String]()
    @Published var filterListOfAllAzakar=[String]()

    
    
    @Published   var filtered : [AzkarModek] = []
    @Published var search = ""
    
    
    init() {
        totalAzakar = Bundle.main.decode("azkar.json")
        
        var ff = totalAzakar.unique(map: {$0.category})
        
          let xx =  ff.map{$0.category}
        
        DispatchQueue.main.async {
            self.listOfAllAzakar=xx
            self.filterListOfAllAzakar=xx
        }
        
//        print(xx)
        //        elsabahAzakar.append(
        
        elsabahAzakar =  totalAzakar.filter{$0.category=="أذكار الصباح"}
        elmassaAzakar =  totalAzakar.filter{$0.category=="أذكار المساء"}
        sleep =  totalAzakar.filter{$0.category=="أذكار الاستيقاظ من النوم"}
        
        clothes =  totalAzakar.filter{$0.category=="دعاء لبس الثوب الجديد"}

        s_5 =  totalAzakar.filter{$0.category ==  "الذكر بعد الفراغ من الوضوء"}
        s_6 =  totalAzakar.filter{$0.category=="الذكر عند الخروج من المنزل" }
        s_7 =  totalAzakar.filter{$0.category=="أذكار الآذان" }
        s_8 =  totalAzakar.filter{$0.category=="دعاء الاستفتاح" }
        s_9 =  totalAzakar.filter{$0.category=="دعاء الركوع" }
        s_10 =  totalAzakar.filter{$0.category=="دعاء الرفع من الركوع" }
        s_11 =  totalAzakar.filter{$0.category=="دعاء السجود" }
        s_12 =  totalAzakar.filter{$0.category=="دعاء الجلسة بين السجدتين" }
        
        s_13 =  totalAzakar.filter{$0.category=="دعاء سجود التلاوة"  }
        s_14 =  totalAzakar.filter{$0.category=="الصلاة على النبي بعد التشهد"  }
        s_15 =  totalAzakar.filter{$0.category=="الدعاء بعد التشهد الأخير قبل السلام"  }
        s_16 =  totalAzakar.filter{$0.category=="الأذكار بعد السلام من الصلاة"  }
        s_17 =  totalAzakar.filter{$0.category=="أذكار النوم"  }
        s_18 =  totalAzakar.filter{$0.category=="دعاء قنوت الوتر"  }
        
        s_19 =  totalAzakar.filter{$0.category=="ما يفعل من رأى الرؤيا أو الحلم في النوم" }
        
    }
    
    func makeSearchOperation ()  {
        if search != ""{
            
            searchColor()
        }
        else{
            
            // clearing all search results..
            
            search = ""
            filtered = totalAzakar
            
        }
    }
    
    func getData(ss:String) -> [AzkarModek] {
        totalAzakar.filter{$0.category==ss }
    }
    
    func searchColor(){
        
        // filtering...
        
        let query = search.lowercased()
        
        // using bg thread to reduce Main ui Usage...
        
        DispatchQueue.global(qos: .background).async {
            
            let filter = self.listOfAllAzakar.filter { (gradient) -> Bool in
                
                if gradient.lowercased().contains(query){
                    
                    return true
                }
                else{
                    
                    return false
                }
            }
//            let filter = self.totalAzakar.filter { (gradient) -> Bool in
//
//                if gradient.category.lowercased().contains(query){
//
//                    return true
//                }
//                else{
//
//                    return false
//                }
//            }
            
            // Refreshing View...
            DispatchQueue.main.async {
                
                // adding animation..
                
                withAnimation(.spring()){
                    
                    self.filterListOfAllAzakar = filter
                }
            }
        }
    }
    
}


extension Bundle {
    func decode(_ file: String) -> [AzkarModek] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([AzkarModek].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
    
//    func decodeS(_ file: String) -> [NamesModel] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode(MainModel.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded.data
//    }
  
    func decodeS(_ file: String) -> [NamesModel] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(MainModel.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded.data
    }
   
//    func decodeS(_ file: String) -> MainModel {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode(MainModel.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
    
}

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}
