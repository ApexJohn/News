//
//  ViewController.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/24/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var reachabilityLabel: UILabel!
    
    private var reachabilityManager = NetworkReachabilityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reachabilityManager = NetworkReachabilityManager(host: "www.apple.com")
        
        self.reachabilityManager?.listener = { [weak self] state in
            
            switch state {
            case .reachable(.ethernetOrWiFi):
                self?.reachabilityLabel.text = NSLocalizedString("You are online", comment: "")
            case .notReachable:
                self?.reachabilityLabel.text = NSLocalizedString("You are offline", comment: "")
            default:
                self?.reachabilityLabel.text = NSLocalizedString("You are offline", comment: "")
                
            }
        }
        
        self.reachabilityManager?.startListening()
    }
}
