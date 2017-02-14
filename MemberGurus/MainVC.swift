//
//  MainVC.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Member>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        generateTestData()
        attemptFetch()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
        
    }
    
    func configureCell(cell: MemberCell, indexPath: NSIndexPath){
        
        let member = controller.object(at: indexPath as IndexPath)
        cell.configureCell(member: member)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func attemptFetch(){
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch(type) {
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath{
                let cell = tableView.cellForRow(at: indexPath) as! MemberCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }

    func generateTestData(){
        let member1 = Member(context: context)
        member1.name = "James"
        member1.age = 23
        //member1.plat
        
        let member2 = Member(context: context)
        member2.name = "Michael"
        member2.age = 25
        
        let member3 = Member(context: context)
        member3.name = "Yolo"
        member3.age = 25
        
        let member4 = Member(context: context)
        member4.name = "Jessie"
        member4.age = 21
        
        let member5 = Member(context: context)
        member5.name = "Lisa"
        member5.age = 33
        
        let member6 = Member(context: context)
        member6.name = "Steph"
        member6.age = 24
    }

}

