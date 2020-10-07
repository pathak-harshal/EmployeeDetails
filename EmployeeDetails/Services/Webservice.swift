//
//  Webservice.swift
//  EmployeeDetails
//
//  Created by Harshal Pathak on 06/10/20.
//

import Foundation

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {

    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    
    func loadEmployees(completion :@escaping ([Employee]) -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let sourceDictionary = json as! JSONDictionary
                let dictionaries = sourceDictionary["data"] as! [JSONDictionary]
                print("count \(dictionaries.count)")
                let sources = dictionaries.flatMap(Employee.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
        }.resume()
        
    }
    
}
