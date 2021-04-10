//
//  CoreDataManager.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import CoreData

class CoreDataManager {
    
    private let viewContext: NSManagedObjectContext = {
        let persistentContainer = NSPersistentContainer(name: "CoreDataTraining")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error { fatalError("Loading of store failed: \(error)") }
        }
        return persistentContainer.viewContext
    }()
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    //MARK: Create
    
    func insertCompany(imageData: Data, name: String, date: Date) -> Company? {
        let company = Company(context: viewContext)
        company.imageData = imageData
        company.name = name
        company.founded = date
        
        do {
            try viewContext.save()
            return company
        } catch { return nil }
    }
    
    func insertEmployee(name: String, location: String, type: String, company: Company) -> Employee? {
        let employee = Employee(context: viewContext)
        employee.name = name
        employee.location = location
        employee.type = type
        employee.company = company
        
        do {
            try viewContext.save()
            return employee
        } catch { return nil }
    }
    
    //MARK: Read
    
    func fetchCompanies() -> [Company]? {
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try viewContext.fetch(fetchRequest)
            return companies
        } catch { return nil }
    }
    
    func fetchEmployees(for company: Company) -> [Employee] {  return company.employees?.allObjects as! [Employee] }
    
    //MARK: Update
    
    func update() -> Bool {
        do {
            try viewContext.save()
            return true
        } catch { return false }
    }
    
    //MARK: Delete
    
    func deleteAllCompanies() -> Bool {
        do {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
            try viewContext.execute(batchDeleteRequest)
            return true
        } catch { return false }
    }
    
    func deleteCompany(company: Company) -> Bool {
        do {
            viewContext.delete(company)
            try viewContext.save()
            return true
        } catch { return false }
    }
    
    func deleteEmployee(employee: Employee) -> Bool {
        do {
            viewContext.delete(employee)
            try viewContext.save()
            return true
        } catch { return false }
    }
    
}

