//
//  ViewController.swift
//  Tip Calc
//
//  Created by Paramjot Bhatia on 5/8/16.
//  Copyright © 2016 Paramjot Singh Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var percentSignLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var tipWordLabel: UILabel!
    
    @IBOutlet weak var tipMeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipTextField.hidden = true
        
        billField.center.x = self.view.frame.width + 30
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 6, options: [], animations: {
            self.billField.center.x = self.view.frame.width / 2
            }, completion: nil)
        
        
        tipMeLabel.center.y = self.view.frame.width + 30
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 6, options: [], animations: {
            self.tipMeLabel.center.y = self.view.frame.width / 2
            }, completion: nil)
        
        percentSignLabel.hidden = true
 
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1.5, animations: {
            self.tipTextField.alpha = 1.0
            
        })
        
    }
    
    
    override func viewDidLayoutSubviews()
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: billField.frame.size.height - width, width:  billField.frame.size.width, height: billField.frame.size.height)
        
        border.borderWidth = width
        billField.layer.addSublayer(border)
        billField.layer.masksToBounds = true
        
        
        
        let border2 = CALayer()
        let width2 = CGFloat(1.0)
        border2.borderColor = UIColor.whiteColor().CGColor
        border2.frame = CGRect(x: 0, y: tipTextField.frame.size.height - width, width:  tipTextField.frame.size.width, height: tipTextField.frame.size.height)
        
        border2.borderWidth = width2
        tipTextField.layer.addSublayer(border2)
        tipTextField.layer.masksToBounds = true
        
        billField.attributedPlaceholder = NSAttributedString(string:"Enter Bill Amount", attributes:[NSForegroundColorAttributeName: UIColor.yellowColor()])
        
        tipTextField.attributedPlaceholder = NSAttributedString(string:"Enter Tip", attributes:[NSForegroundColorAttributeName: UIColor.yellowColor()])
        
    }
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.10, 0.15, 0.18, 0.20, 0]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        if tipPercentage == tipPercentages[4]
        {
            tipTextField.hidden = false
            tipTextField.enabled = true
            tipLabel.hidden = false
            tipWordLabel.hidden = false
            
            
            tipControl.hidden = false
            tipLabel.text = "$0.00"
            
            
            tipTextField.alpha = 1.0
            totalLabel.text = "$0.00"
            
            percentSignLabel.hidden = false
            percentSignLabel.alpha = 1.0
            
            
            
            if (billField.text == "")
            {
                tipTextField.enabled = false
                tipTextField.alpha = 0.5
                percentSignLabel.alpha = 0.5
                
            }
    
            
        }
            
        else
        {
            percentSignLabel.hidden = true
            var billAmount = (billField.text! as NSString).doubleValue
            
            var tip = (billAmount) * tipPercentage
            
            var total = billAmount + tip
            
            tipLabel.text = "$\(tip)"
            
            totalLabel.text = "$\(total)"
            
            
            tipLabel.text = String(format: "$%.2f", arguments: [tip])
            totalLabel.text = String(format: "$%.2f", arguments: [total])
            
            tipTextField.hidden = true
            tipWordLabel.hidden = false
            tipLabel.hidden = false
            
        }
  
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    @IBAction func tipTextFieldChanged(sender: AnyObject) {
        
        
        var billAmount2 = (billField.text! as NSString).doubleValue
        
        var tipTextFieldValue = (tipTextField.text! as NSString).doubleValue / 100
        
        var tip2 = billAmount2 * tipTextFieldValue
        
        var total2 = billAmount2 + tip2
        
        tipLabel.hidden = false
        tipWordLabel.hidden = false
        
        totalLabel.text = "$\(total2)"
        
        tipLabel.text = "$\(tip2)"
        
        tipLabel.text = String(format: "$%.2f", arguments: [tip2])
        
        totalLabel.text = String(format: "$%.2f", arguments: [total2])
        
        tipControl.hidden = false
        
        
        
    }
    
    
}

