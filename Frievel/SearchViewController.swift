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
    
    @IBOutlet weak var stackView: UIStackView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = false
        setPickerView()
    }
    
    func setPickerView() {
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
    
    @IBAction func AdvancedSerachValueChanged(sender: AnyObject) {
        let advancedSearch = sender as! UISwitch
        
        if advancedSearch.on {
            enableAllSubviews(view: stackView, enabled: true)
        } else {
            enableAllSubviews(view: stackView, enabled: false)
        }
    }
    
    func enableAllSubviews(view view: UIView, enabled: Bool) {
        for view in view.subviews {
            if view.subviews.count > 0 {
                enableAllSubviews(view: view, enabled: enabled)
            }
            
            if let label = view as? UILabel {
                label.enabled = enabled
            }
            
            if let uiSwitch = view as? UISwitch {
                uiSwitch.enabled = enabled
            }
        }

    }
    
}