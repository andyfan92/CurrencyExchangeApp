//
//  ViewController.swift
//  CurrencyExchangeApp
//
//  Created by fan on 10/19/21.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class ViewController: UIViewController {
   

    @IBOutlet weak var pickFrom: UIPickerView!
    
    @IBOutlet weak var pickTo: UIPickerView!
    
    
    @IBOutlet weak var lblText: UILabel!
    let baseURL        = "http://api.exchangeratesapi.io/v1/latest?access_key=3a029e0b1c1936813e1812221a1efa96&format=1"
    
    let transURL = "http://api.exchangeratesapi.io/v1/latest?access_key=3a029e0b1c1936813e1812221a1efa96&base="
    
    var fromDelegate: FromPickerDelegate = FromPickerDelegate()
    
    var toDelegate: ToPickerDelegate = ToPickerDelegate()
    var currency: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        AF.request(baseURL).responseJSON{ response in

            let res = JSON(response.data).dictionary
//            print(res?["base"])
//            print(res?["rates"]!["ERN"])
            let rates = res?["rates"]?.dictionary
            var keys = rates?.keys
            for key in keys! {
                self.currency.append(key)
            }
            self.currency = self.currency.sorted(by:{name1 , name2 in
                return name1.localizedStandardCompare(name2) == ComparisonResult.orderedAscending
            })
            
            self.fromDelegate.fromData = ["EUR"]
            self.toDelegate.toData = self.currency
            
            self.pickFrom.dataSource = self.fromDelegate
            self.pickFrom.delegate = self.fromDelegate
            self.pickTo.delegate = self.toDelegate
            self.pickTo.dataSource = self.toDelegate
        }
        
    }
    
    

    @IBAction func btnSubmit(_ sender: Any) {
        var from = "EUR"
        var to = self.currency[pickTo.selectedRow(inComponent: 0)]
        print ("from \(from) to \(to)")
        
        var url = transURL + from + "&symbols=" + to
        print(url)
        AF.request(url).responseJSON{ [self] response in
            let res = JSON(response.data).dictionary
            let rates = res?["rates"]?.dictionary
            var value = rates?[to]?.stringValue
            self.lblText.text = "1\(from) = \(value!)\(to)"
        }
        
    }
    
    
}

