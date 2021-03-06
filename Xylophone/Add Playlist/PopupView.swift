//
//  PopupView.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/31/22.
//

import UIKit
@IBDesignable
final class PopupView: UIView{
    //MARK: - set frame to initial view
    let popupView = UIView(frame: CGRect.zero)
       let popupTitle = UILabel(frame: CGRect.zero)
       let popupText = UITextField(frame: CGRect.zero)
       let popupButton = UIButton(frame: CGRect.zero)
       
       let BorderWidth: CGFloat = 2.0
       
    //MARK: - initialize view and its subview
    override init(frame: CGRect) {
           super.init(frame: frame)
           // Semi-transparent background
           backgroundColor = UIColor.black.withAlphaComponent(0.3)
           
           // Popup Background
           popupView.layer.borderWidth = BorderWidth
           popupView.layer.borderColor = UIColor.white.cgColor
           
           // Popup Title
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
           popupText.textColor = UIColor.black
           popupText.font = UIFont.systemFont(ofSize: 25.0, weight: .semibold)
           popupText.text = "New Playlist"
           popupText.restorationIdentifier = popupText.text
           popupText.backgroundColor = UIColor.white
           popupText.textAlignment = .center
           
           
           // Popup Button
           popupButton.setTitle("Done", for: .normal)
           popupButton.setTitleColor(UIColor.white, for: .normal)
           popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupButton.backgroundColor = UIColor.red
           
           
           popupView.addSubview(popupTitle)
           popupView.addSubview(popupText)
           popupView.addSubview(popupButton)
           
           // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
           addSubview(popupView)
           
           //MARK: - give frame the subviews of our view
           
           
           // PopupView constraints
           popupView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               popupView.widthAnchor.constraint(equalToConstant: 293),
               popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
               popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
               ])
           
           // PopupTitle constraints
           popupTitle.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
               popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
               popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
               popupTitle.heightAnchor.constraint(equalToConstant: 55)
               ])
           
           
           // PopupText constraints
           popupText.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               popupText.heightAnchor.constraint(greaterThanOrEqualToConstant: 67),
               popupText.topAnchor.constraint(equalTo: popupTitle.bottomAnchor, constant: 0),
               popupText.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
               popupText.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
               popupText.bottomAnchor.constraint(equalTo: popupButton.topAnchor, constant: 0)
               ])

           
           // PopupButton constraints
           popupButton.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               popupButton.heightAnchor.constraint(equalToConstant: 44),
               popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
               popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
               popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth)
               ])
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
   }

//MARK: - protocol delegate to update Name
protocol updateAlbumName{
    func setAlbumName(_ albumName:String)
    
}

