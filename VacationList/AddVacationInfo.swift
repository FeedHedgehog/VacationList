//
//  AddVacationInfo.swift
//  VacationList
//
//  Created by Liulu on 14/10/23.
//  Copyright (c) 2014年 Liulu. All rights reserved.
//

import UIKit

class AddVacationInfo: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    var vacation=Vacation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as NSObject == doneBtn{
            if !textField.text.isEmpty{
                vacation.place=textField.text
            }
        }
    }
    

}
