//
//  ViewController.swift
//  FibonacciSequence F_n = F_{n-1} + F_{n-2}
//
//  Created by Chuck Gaffney on 10/30/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//

//====MAIN CLASS=======

import UIKit

//Global Array that will hold the Fibonacci number
var fibNumberArray: [Double] = []

enum fibTestType{
    
    case Swift
    case ObjC
    case CPlusPlus
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textField = UITextField()

    var num: Int = 0
    
    //class object
    var fib : Fibonacci?
    
    //Sequence generator of type Int
   // var fibGenerator : GeneratorOf<Int>?
    
    //StoryBoard Vars
    @IBOutlet var tableView: UITableView!
        
    @IBOutlet var fibLimitNum: UITextField!

    @IBAction func endText(sender: AnyObject) {
        
        textField = sender as UITextField
        
        println(textField.text)
        
        //displayFibonacci()
        
        println("Number entered")
        
        
    }
    
    
    //opens the app and sets the TableView to the default value
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    //Button listeners
    @IBAction func swiftSequenceSelected(sender: UIButton) {
        
        displayFibonacci(language: .Swift)
        
    }
    
    @IBAction func objCSequenceSelected(sender: UIButton) {
        
        displayFibonacci(language: .ObjC)
        
    }
    
    @IBAction func cppSequenceSelected(sender: UIButton) {
        
        displayFibonacci(language: .CPlusPlus)
        
    }
    
    //Fibonacci class calls
    
    func displayFibonacci(#language:fibTestType){
        
        resetFib()
        
        if let num = textField.text.doubleValue{
            
            //tells user it's formulating the numbers
            textField.text = "Calculating..."
            
            switch language{
            case .Swift:
                fib = Fibonacci()
                fib?.run(num)
            case .ObjC:
                FibObjC.ObjCFib(Int(num))
            case .CPlusPlus:
                ObjCPP.fibCPlusPlus(num)
            default:
                fib = Fibonacci()
                fib?.run(num)
            }
            
            
        }
        /*else if (num >= Int.max){
           textField.text = "INT Overflow"
        }*/
        
        //display error if no numbers where entered
        else{
            textField.text = "ERROR"
        }
        
        //refreashes the table
        tableView.reloadData()
        
        //schedule the remvoing the "Calculating" text
        let tempDelay = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: Selector("clearText"), userInfo: nil, repeats: false)

    }

   
    //TableView functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibNumberArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let noDecimalFormat = ".0"
        
        let cellText = fibNumberArray[indexPath.row].format(noDecimalFormat)
        
        cell.textLabel?.text = cellText
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
    }
        
    
    // Memory Management
    func clearText(){
        
        textField.text = ""
    }
    
    //resets the arrays and Sequence object; clears data for ARC
    func resetFib(){
        fibNumberArray.removeAll(keepCapacity: false)
        //fibGenerator = nil
        fib = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

