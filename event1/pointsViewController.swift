//
//  pointsViewController.swift
//  event1
//
//  Created by Tanja Keune on 7/3/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

class pointsViewController: UIViewController {

    var pointsArray = [0, 0, 0]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resou
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showAd" {
            
            let destination = segue.destination as! ViewController
            
            destination.pointsArray = pointsArray
        }
    }

    @IBAction func adPoints(_ sender: AnyObject) {
        
        let buttonPressed = sender.tag - 1
        
        if pointsArray[buttonPressed] == 0 {
            
            pointsArray[buttonPressed] = 1
        } else {
            pointsArray[buttonPressed] = 0
        }
        print(pointsArray)
        performSegue(withIdentifier: "showAd", sender: nil)
    }
    
    
}
