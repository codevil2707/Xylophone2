//
//  SonglistTableViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import Foundation
import UIKit

class PlayListViewController:UIViewController{
    
    var selectedAlbum:AlbumStruct?
    var selectedIndex:Int?
   
    @IBOutlet weak var selectedAlbumName: UILabel!
    @IBOutlet weak var selectedAlbumImage: UIImageView!
    @IBOutlet weak var playListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playListTableView.dataSource = self
        playListTableView.delegate = self
        setNavBarOfSonglist()
        selectedAlbumName.text = selectedAlbum?.albumName
        selectedAlbumImage.image = selectedAlbum?.albumImage
       
    }
    func setNavBarOfSonglist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        var navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Songlist")
        let rightItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickedCancel))

       navItem.rightBarButtonItem = rightItem
        navBar.setItems([navItem], animated: false)
    }
    @objc func onClickedCancel(){
        navigationController?.popViewController(animated: true)
    }
    
    func pushToMusicPlayer(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AudioPlayerViewController") as! AudioPlayerViewController
        destination.playerLogic.songlist = (selectedAlbum?.albumPlaylist)!
        destination.playerLogic.currentSongIndex = selectedIndex!
        navigationController?.present(destination, animated: true, completion: nil)
        
    }
}
extension PlayListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = playListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlaylistTableViewCell
        selectedIndex = indexPath.row
        pushToMusicPlayer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedAlbum?.albumPlaylist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlaylistTableViewCell
        cell.playlistSongName.text = selectedAlbum?.albumPlaylist?[indexPath.row].songName
        return cell
    }
    
}
