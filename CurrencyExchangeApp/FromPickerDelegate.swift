//
//  FromPickerDelegate.swift
//  CurrencyExchangeApp
//
//  Created by fan on 10/19/21.
//

import UIKit

class FromPickerDelegate: NSObject, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var fromData: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fromData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fromData[row]
    }
    
    
    

}
