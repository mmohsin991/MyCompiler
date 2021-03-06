//
//  ViewController.swift
//  MyCompiler
//
//  Created by Mohsin on 28/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Cocoa
import AppKit

// constant
let myGreenColor = NSColor(red: 0.01, green: 0.58, blue: 0.21, alpha: 1.0)
let myBlueColor = NSColor(red: 0.35, green: 0.79, blue: 0.98, alpha: 1.0)



class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet var txtView: NSTextView!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var btnRun: NSButton!
    

    @IBOutlet weak var lblSyntaxMessage: NSTextFieldCell!
    
    
    var filePath : String?
    var str = "void Main() a++===5.5+=**/= { \n int a = 10 \n float sAA = 1.3 \n }"
    var str1 = "abc+-d--e*=5'd'6 \"mohsin--e*=56 ds\"a //haha 'd' mmmm sa\n "
    var str2 = "abc '\\sagg' sa"
    
    var myTokens = [MyToken]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    
    
    
    
    
    // MARK: NSTableviewdelegates
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.myTokens.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        
        return "mohsi"
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        if tableColumn?.identifier == "Line" {
            
            cellView.textField?.stringValue = self.myTokens[row].lineNumber
            cellView.textField?.textColor = NSColor.blackColor()
            if self.myTokens[row].classType == "SYNTAX ERROR" {
                cellView.textField?.textColor = NSColor.redColor()
            }
        }
        else if tableColumn?.identifier == "Class" {
            
            cellView.textField?.stringValue = self.myTokens[row].classType
            cellView.textField?.textColor = myGreenColor
            if self.myTokens[row].classType == "LEXICAL ERROR" {
                cellView.textField?.textColor = NSColor.redColor()
            }
            else if self.myTokens[row].classType == "Identifier" {
                cellView.textField?.textColor = NSColor.blueColor()
            }
            else if self.myTokens[row].classType == "KeyWord" {
                cellView.textField?.textColor = NSColor.darkGrayColor()
            }
        }
        else if tableColumn?.identifier == "Value" {
            
            cellView.textField?.stringValue = self.myTokens[row].value
            cellView.textField?.textColor = myBlueColor
            if self.myTokens[row].classType == "LEXICAL ERROR" {
                cellView.textField?.textColor = NSColor.redColor()
            }

        }
        
        
        return cellView
    }
    
    
    
    
    
    @IBAction func openFile(sender: NSButton) {
        let panel = NSOpenPanel()
        panel.allowedFileTypes = ["txt"]
        panel.beginWithCompletionHandler { (result) -> Void in
            if result == NSFileHandlingPanelOKButton{
                
                if let fileUrl = panel.URLs[0] as? NSURL{
                    println(fileUrl)
                    self.filePath = fileUrl.path!
                    
                    var error : NSError?
//                    let data = NSData(contentsOfFile: fileUrl.path!)
//                    let attributedString = NSAttributedString(RTF: data!, documentAttributes: nil)
//                    self.txtView.string = attributedString?.string
                    
                    let string = NSString(contentsOfFile: self.filePath!, encoding: NSUTF8StringEncoding, error: &error)
                    self.txtView.string = string?.description

                }
            }
        }
        
        
    }
    
    @IBAction func saveFile(sender: NSButton) {
        
        if self.filePath != nil {
            var error : NSError?
            self.txtView.string?.writeToFile(self.filePath!, atomically: true,
                encoding: NSUTF8StringEncoding, error: &error)
        }
        else{
            let panel = NSSavePanel()
            panel.nameFieldStringValue = "NewFile.txt"
            panel.beginWithCompletionHandler { (result) -> Void in
                if result == NSFileHandlingPanelOKButton{
                    
                        println(panel.URL)
                    if let url = panel.URL {
                        self.filePath = url.path
                        var error : NSError?
                        self.txtView.string?.writeToFile(self.filePath!, atomically: true,
                            encoding: NSUTF8StringEncoding, error: &error)
                    }
                }
            }
        }
    }

    @IBAction func run(sender: NSButton) {
        
        // clear tokens
        self.myTokens = []
        
        var wordsArr = TokenString.generateWords(self.txtView.string!)
        
        for wordStr in wordsArr{
            if wordStr.0 != " "{
                let myToken = MyToken.stringToMyToken(wordStr.0, lineNumber: wordStr.1)
                self.myTokens.append(myToken)
                println(wordStr)
            }
        }
        for token in self.myTokens{
            token.decs()
        }
        
        
        
        // Syntax analyzer
        
        globleTokens = self.myTokens
        globleIndex = 0
        
        if Body.Body() {
            self.lblSyntaxMessage.textColor = myGreenColor
            self.lblSyntaxMessage.title = "Syntax Passed"
            print("Syntax Passed")
        }
        else{
            self.lblSyntaxMessage.textColor = NSColor.redColor()
            self.lblSyntaxMessage.title = " Syntax Failed \n Line # \(globleTokens[globleIndex].lineNumber)"

            print("Syntax Failed")
            print("\nLine # \(globleTokens[globleIndex].lineNumber)   class value : \(globleTokens[globleIndex].value)")
        }
        
        
        
        self.tableView.reloadData()
    }
}




