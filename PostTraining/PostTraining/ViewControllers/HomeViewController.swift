//
//  HomeViewController.swift
//  PostTraining
//
//  Created by prk on 19/04/23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrOfInitial = [String]()
    var arrOfName = [String]()
    var context: NSManagedObjectContext!
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfInitial.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //data tiap cellnya dikasi apa
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.initialTxt.text = arrOfInitial[indexPath.row]
        cell.nameTxt.text = arrOfName[indexPath.row]
        cell.updateHandler = {
            self.updateData(cell:cell,indexPath:indexPath)
        }
        
        return cell
    }
    
    func updateData(cell: UITableViewCell, indexPath: IndexPath){
        
    }
    

    @IBOutlet weak var initialTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var assistantTv: UITableView!
    
    @IBAction func doInsert(_ sender: Any) {
        // ambil txt
        // bikin entity
        // bikin new assistant
        // save
        
        let name = nameTxt.text!
        let initial = initialTxt.text!
        print("test")
        let entity = NSEntityDescription.entity(forEntityName: "Assistants", in: context)
        let newAssistant = NSManagedObject(entity: entity!, insertInto: context)
        
        //set value
        newAssistant.setValue(name, forKey: "name")
        newAssistant.setValue(initial, forKey: "initial")
        
        do{
            try context.save()
            loadData()
        }
        catch{
            
        }
    }
    
    //reload data
    func loadData(){
        // load data berdasarkan array yg ada
        arrOfInitial.removeAll()
        arrOfName.removeAll()
        
        //select all terus masukin ke arraynya
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Assistants")
        
        do{
            let res = try context.fetch(req) as! [NSManagedObject]
            
            for data in res {
                arrOfInitial.append(data.value(forKey:"initial") as! String)
                arrOfName.append(data.value(forKey:"name") as! String)
            }
            
            assistantTv.reloadData()
        }
        catch{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        assistantTv.delegate = self
        assistantTv.dataSource = self
        
        loadData()
        
        
        
    }

}
