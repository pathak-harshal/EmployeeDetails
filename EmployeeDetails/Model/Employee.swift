//
//  Employee.swift
//  EmployeeDetails
//
//  Created by Harshal Pathak on 06/10/20.
//

import Foundation


class Employee {
    
    var id: String!
    var name: String!
    var salary: String!
    var age: String!
    
    
    
    init?(dictionary :JSONDictionary) {
        
        guard let id = dictionary["id"] as? String,
        let name = dictionary["employee_name"] as? String,
            let salary = dictionary["employee_salary"] as? String,
            let age = dictionary["employee_age"] as? String  else {
                return nil
    }
        
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
}
    
    init(viewModel: EmployeeViewModel) {
        
        self.id = viewModel.id
        self.name = viewModel.name
        self.salary = viewModel.salary
        self.age = viewModel.age
    }
    
}
