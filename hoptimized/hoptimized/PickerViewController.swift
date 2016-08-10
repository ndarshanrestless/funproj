//
//  PickerViewController.swift
//  hoptimized
//
//  Created by Darshan Nagarajappa on 8/9/16.
//  Copyright © 2016 darshanproject. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var recevedFilterName: String!
    
    @IBOutlet var picker: UIPickerView!
    
    @IBOutlet var chosenValue: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var ranksArray = ["1st", "2nd", "3rd", "4th", "5th", "6th"]
    var placementAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ranksArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ranksArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
    return 1 // since we only have one function
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        chosenValue.text = ranksArray[placementAnswer]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
        chosenValue.text = ranksArray[placementAnswer]
        NSLog("Rank chosen")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            //meal = Meal(name: name, photo: photo, rating: rating)
            chosenValue.text = ranksArray[placementAnswer]
        }
    }

}
