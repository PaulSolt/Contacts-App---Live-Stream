//
//  ViewController.swift
//  Contact App
//
//  Created by Paul Solt on 11/25/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var milePaceTextField: UITextField!
    
    var myContact: Contact?
    var path: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var contact = Contact(firstName: "Joe", lastName: "Smith", email: "PaulSolt@iPhoneDev.tv", age: 40, milePace: 6.5)
//       println("contact: \(contact)")
        
        // setup the path
        path = fileInDocumentsDirectory("contact.plist")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addContactPressed(sender: AnyObject) {
        println("addContact")
        
//        var contact = createContactFromUI()
//        if contact != nil {
        if let contact = createContactFromUI() {
            println("Valid contact: \(contact)")
            
            myContact = contact
            
        } else { // not a valid contact
            println("Error invalid contact")
        }
        
        
    }
    
    func createContactFromUI() -> Contact? {
        var contact: Contact? = nil
        
        if !firstNameTextField.text.isEmpty {
            
            if !lastNameTextField.text.isEmpty {
                
                if !emailTextField.text.isEmpty {
                    
                    let numberFormatter = NSNumberFormatter()
                    numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    
                    
                    
//                    if age != nil {
                    if let age = numberFormatter.numberFromString(ageTextField.text)?.integerValue {
                    
                        if let milePace = numberFormatter.numberFromString(milePaceTextField.text)?.doubleValue {
                            
                            // Valid data has been provided... create a Contact
                            
                            contact = Contact(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text, age: age, milePace: milePace)
                            
                        }
                        
                        
                    } else {
                        // invalid age
                    }
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
        } else {
            println("firstName is empty")
        }
        
        
        
        return contact
    }
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
    
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        ageTextField.text = ""
        milePaceTextField.text = ""
    }
    
    // documents directory
    
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        return documentsFolderPath
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        return documentsDirectory().stringByAppendingPathComponent(filename)
    }


    @IBAction func saveButtonPressed(sender: AnyObject) {
    
        // NSKeyedArchiver
        
        // path -> documents directory

        println("save: \(path)")
        
        var success = false
        
        if let contact = myContact {
            success = NSKeyedArchiver.archiveRootObject(contact, toFile:path)
            
            if success {
                println("Saved successfully")
            } else {
                println("Error saving data file")
            }
        }

        
    }
    
    @IBAction func loadButtonPressed(sender: AnyObject) {
        
        if let contact = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as Contact? {
            
            // add to UI
            firstNameTextField.text = contact.firstName
            lastNameTextField.text = contact.lastName
            emailTextField.text = contact.email
            ageTextField.text = String(contact.age)
            milePaceTextField.text = "\(contact.milePace)"
        }
        
        
    }
    
}



















