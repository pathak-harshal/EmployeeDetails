//
//  EmployeeListViewModel.swift
//  EmployeeDetails
//
//  Created by Harshal Pathak on 06/10/20.
//

import Foundation

class EmployeeListViewModel : NSObject {
    
    @objc dynamic private(set) var employeeViewModels :[EmployeeViewModel] = [EmployeeViewModel]()
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    private var webservice :Webservice
    
    init(webservice :Webservice) {
        
        self.webservice = webservice
        super.init()
        
        token = self.observe(\.employeeViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        
        // call populate sources
        populateSources()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateSources() {
        
        self.webservice.loadEmployees { [unowned self] employees in
            self.employeeViewModels = employees.compactMap(EmployeeViewModel.init)
        }
    }
    
    
    
    func employee(at index:Int) -> EmployeeViewModel {
        return self.employeeViewModels[index]
    }
}

class EmployeeViewModel : NSObject {
    
    var id :String?
    var name :String
    var salary :String
    var age: String
    
    init(employee: Employee) {
        
        self.id = employee.id
        self.name = employee.name
        self.salary = employee.salary
        self.age = employee.age
    }
}

