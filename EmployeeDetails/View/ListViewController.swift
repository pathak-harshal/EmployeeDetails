//
//  ListViewController.swift
//  EmployeeDetails
//
//  Created by Harshal Pathak on 06/10/20.
//

import UIKit

class ListViewController: UITableViewController {

    private var webservice: Webservice!
    private var empolyeeListViewModel: EmployeeListViewModel!
    private var dataSource :TableViewDataSource<EmployeeTableViewCell,EmployeeViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    private func updateUI() {
        
        self.webservice = Webservice()
        self.empolyeeListViewModel = EmployeeListViewModel(webservice: self.webservice)
        
        // setting up the bindings
        self.empolyeeListViewModel.bindToSourceViewModels = {
            print("updateDataSource()")
            self.updateDataSource()
        }
       
    }
    
    private func updateDataSource() {
        
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.employee, items: self.empolyeeListViewModel.employeeViewModels) { cell, emp in
            guard let id = emp.id else {
                return
            }
            cell.lblEmployeeName.text = "\(id) \(emp.name)"
        }
        
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
}

