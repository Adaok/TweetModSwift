//
//  ViewController.swift
//  TweetModSwift
//
//  Created by iem on 11/02/2016.
//  Copyright © 2016 loiodice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPickView: UIPickerView!
    @IBOutlet weak var myField: UITextField!
    
    @IBOutlet weak var PersonalLabel: UILabel!
    
    
    var myPickerData : [[String]] = [[String]]()
    var hashtag : String = "#Swift #Cours #FirstAppIOS"
    var personalPronoun : String = ""
    var tweet : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        personalPronoun = PersonalLabel.text!
        
        //data in picket
        myPickerData = [["dors","mange","suis en cours","galère","cours","poireaute"],
            ["🙂","😉","😟","😮","😃","😄","😎"]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData[component].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[component][row]
    }
    
    @IBAction func tweetButton(sender: AnyObject) {
        
        tweet = myField.text!
        
        if(tweet == ""){
            let t1 : Int = myPickView.selectedRowInComponent(0)
            let t2 : Int = myPickView.selectedRowInComponent(1)
            
            tweet = personalPronoun + myPickerData[0][t1] + " " + myPickerData[1][t2] + " " + hashtag
        }
        
        print(tweet)
        
    }

    @IBAction func gestureAction(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }


}