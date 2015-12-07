//
//  SearchViewController.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/7/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var countryPicker: UIPickerView!
    var countryArray = [String]()
    var selectedCounty: String?
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let locale = NSLocale.currentLocale()
        let array = NSLocale.ISOCountryCodes()
        
        for contry in array {
            let display = locale.displayNameForKey(NSLocaleCountryCode, value: contry)
            countryArray.append(display!)
        }
        countryArray.sortInPlace()
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCounty = countryArray[row]
    }
    
    
}