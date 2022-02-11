//
//  PopupView.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/31/22.
//

import UIKit
@IBDesignable
final class PopupView: UIView{
    //MARK: - initialize view and its subview
    override init(frame: CGRect) {
           super.init(frame: frame)
           // Semi-transparent background
           backgroundColor = UIColor.black.withAlphaComponent(0.3)
           
         
           
           // Popup Title
        let popupTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height*0.3))
           popupTitle.text = "Playlist's Name"
           popupTitle.textColor = UIColor.red
           popupTitle.backgroundColor = UIColor.white
           popupTitle.layer.masksToBounds = true
           popupTitle.adjustsFontSizeToFitWidth = true
           popupTitle.clipsToBounds = true
           popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupTitle.numberOfLines = 1
           popupTitle.textAlignment = .center
           
           // Popup Text
           let popupText = UITextField(frame: CGRect(x: 0, y: self.frame.height*0.3, width: self.frame.width, height: self.frame.height*0.4))
           popupText.textColor = UIColor.black
           popupText.font = UIFont.systemFont(ofSize: 25.0, weight: .semibold)
           popupText.text = "New Playlist"
           popupText.restorationIdentifier = popupText.text
           popupText.backgroundColor = UIColor.white
           popupText.textAlignment = .center
           
           
           // Popup Button
        let popupButton = UIButton(frame: CGRect(x: 0, y: self.frame.height*0.7, width: self.frame.width,  height: self.frame.height*0.3))
           popupButton.setTitle("Done", for: .normal)
           popupButton.setTitleColor(UIColor.white, for: .normal)
           popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupButton.backgroundColor = UIColor.red
           popupButton.addTarget(self, action: #selector(onDismiss), for: .touchUpInside)
           
           addSubview(popupTitle)
           addSubview(popupText)
           addSubview(popupButton)
           
    }
    @objc func onDismiss(){
        UIView.animate(withDuration: 3) {
            self.center = CGPoint(x: self.superview!.frame.width/2, y: self.superview!.frame.height*1.2)
             let Hidden = true
        } completion: { Hidden in
            self.removeFromSuperview()
        }

    }
           
           //MARK: - give frame the subviews of our view
          
           
       
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
   }

//MARK: - protocol delegate to update Name
protocol updateAlbumName{
    func setAlbumName(_ albumName:String)
    
}



