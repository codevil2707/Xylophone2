//
//  PopupViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 2/1/22.
//

//import UIKit
//
//class PopupViewController: UIViewController {
//    let popUpWindowView = PopupView()
//   static var delegate:updateAlbumName?
//    //MARK: - initialize popup view
//    init() {
//            super.init(nibName: nil, bundle: nil)
//            modalTransitionStyle = .crossDissolve
//            modalPresentationStyle = .overFullScreen
//            popUpWindowView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
//            view = popUpWindowView
//       
//
//        required init(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//        
//        
//        @objc func dismissView(){
//            self.dismiss(animated: true, completion: nil)
//            let name:String = popUpWindowView.popupText.text ?? "New Playlist"
//            PopupViewController.delegate?.setAlbumName(name)
//        }
//   
//}
