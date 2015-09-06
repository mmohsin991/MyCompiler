//
//  ViewController.swift
//  MyCompiler
//
//  Created by Mohsin on 28/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var txtView: NSTextView!
    
    
    var filePath : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
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
                    }
                }
            }
        }
    }

}

