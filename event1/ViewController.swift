//
//  ViewController.swift
//  event1
//
//  Created by Tanja Keune on 7/3/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {

    @IBOutlet weak var presentLabel: UILabel!
    
    @IBOutlet weak var buttonAdPoint: UIButton!
    
    var interstitial: GADInterstitial!
    
    var pointsArray = [0,0,0]
    
    var adShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        interstitial = createAndLoadInterstitial()
       
        NotificationCenter.default.addObserver(self, selector: #selector(self.showInterstitial), name:NSNotification.Name(rawValue: "showInterAd"), object: nil);

        for i in pointsArray {
            
            adShow = true
            if i == 0 {
                adShow = false
            }
        }
        
        if adShow == true {
            //showAd()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showInterAd"), object: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func adPointButton(_ sender: Any) {
   
        performSegue(withIdentifier: "adPoint", sender: nil)
        
    }

    func showInterstitial(){
        if (interstitial!.isReady) {
            self.interstitial.present(fromRootViewController: self)
        }else{
            print("ad not ready?")
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        print("making ad")
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-2556933997218061/5177659638")
        interstitial.delegate = self as! GADInterstitialDelegate
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        interstitial.load(request)
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }

}

