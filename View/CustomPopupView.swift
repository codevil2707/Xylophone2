//
//  CustomPopupView.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/27/22.
//

import UIKit

protocol CustomPopupViewDelegate: class
{
    func customPopupViewExtension(sender: CustomPopupView, didSelectNumber : Int)
}

class CustomPopupView: UIViewController {

    var titleString: String?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton : UIButton!
    
    weak var delegate: CustomPopupViewDelegate?
    static func instantiate() -> CustomPopupView? {
        return CustomPopupView(nibName: CustomPopupView
                               , bundle: .main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleString ?? ""
        doneButton.layer.cornerRadius = 10
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
    }
    
     @objc func doneButtonAction() {
        delegate?.customPopupViewExtension(sender: self, didSelectNumber: 1)
    }
}
