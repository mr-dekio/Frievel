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
    var selectedCounty: String = "All countries"
    
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
        countryArray[0] = "All countries"
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCounty = countryArray[row]
    }
    
    @IBAction func AdvancedSerachValueChanged(sender: AnyObject) {
        let advancedSearch = sender as! UISwitch
        isAdvancedOn = advancedSearch.on
        if advancedSearch.on {
            enableAllSubviews(view: stackView, enabled: true)
        } else {
            enableAllSubviews(view: stackView, enabled: false)
        }
    }
    @IBOutlet weak var hotelSwitch: UISwitch!
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var entertainmentSwitch: UISwitch!
    
    var isAdvancedOn = false
    var searchCriteria = SearchCriterias()
    
    @IBAction func searching() {
        if selectedCounty == "All countries" {
            searchCriteria.country = nil
        }

        searchCriteria.advancedSearch = isAdvancedOn
        
        if isAdvancedOn {
            searchCriteria.includesFood = foodSwitch.on
            searchCriteria.includesHotel = hotelSwitch.on
            searchCriteria.includesEntertainment = entertainmentSwitch.on
        }
        performSegueWithIdentifier("Show", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let myTripsVC = segue.destinationViewController as? ShowTableViewController {
            myTripsVC.records =  DataWarehouse.loadTripRecords().filter({
                let record = $0
                
                var countryMatched = searchCriteria.country == nil ? true : record.searchCriterias.country == searchCriteria.country
                
                if !searchCriteria.advancedSearch {
                    return true
                }
                if record.searchCriterias.includesHotel == searchCriteria.includesHotel &&
                    record.searchCriterias.includesFood == searchCriteria.includesFood &&
                    record.searchCriterias.includesEntertainment == searchCriteria.includesEntertainment {
                        return countryMatched
                }
                
                return false
            })
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