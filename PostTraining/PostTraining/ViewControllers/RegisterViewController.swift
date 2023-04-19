//
//  RegisterViewController.swift
//  PostTraining
//
//  Created by prk on 19/04/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var context: NSManagedObjectContext!
    
    @IBAction func registerClicked(_ sender: Any) {
        // ambil value dari textfield
        // masukin db
        // let var
        // let - > unmutable
        // var -> mutable
        
        let username = usernameTxt.text as! String
        let password = passwordTxt.text as! String
        
        // bikin entuty
        // bikin new user
        // insert aja
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUser = NSManagedObject(entity:entity!, insertInto: context)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(password, forKey: "password")
        
        do{
            try context.save()
            // redirect ke login oage
//            let nextView = LoginViewController()
//            UINavigationController?.pushViewController(nextView, animated: true)
            
            if let nextView = storyboard?.instantiateViewController(withIdentifier: "LoginViewController"){
                navigationController?.pushViewController(nextView, animated: true)
            }
            
        }
        catch{
            print("insert failed")
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate 
        
        context = appDelegate.persistentContainer.viewContext

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     @IBAction func usernameTxt(_ sender: Any) {
     }
     }
    */

}
