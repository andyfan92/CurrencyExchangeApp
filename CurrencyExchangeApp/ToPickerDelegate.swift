//
//  ToPickerDelegate.swift
//  CurrencyExchangeApp
//
//  Created by fan on 10/19/21.
//

import UIKit

class ToPickerDelegate: NSObject, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var toData: [String] = ["1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return toData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return toData[row]
    }
    
    

}
