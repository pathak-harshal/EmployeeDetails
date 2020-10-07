//
//  EmployeeViewModel.swift
//  EmployeeDetails
//
//  Created by Harshal Pathak on 06/10/20.
//

import Foundation

class EmployeeListViewModel {
    //MARK:- Intialization
    init(model: [Employee]? = nil) {
        if let inputModel = model {
            employees = inputModel
        }
    }
    
    var employees: [Employee] = []
}

extension EmployeeListViewModel {
    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        completion(.success(employees))
    }
}
