//
//  PlaylistViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import UIKit

var albumPlaylistArray = [
    AlbumStruct(albumName: "Sufi", albumImage: UIImage(named: "Sufi"), albumPlaylist: [SongInfo(songName: "Kithe Chaliye Tu", songTitle: "Kithe-chaliye-tu", songArtist: "Jubin Nautiyal", songImage:"Kithe Chaliye Tu" , songExt: "mp3"),
                SongInfo(songName: "Filhaal-2-Mohabbat", songTitle:  "Filhaal-2-Mohabbat", songArtist: "B-praak", songImage:  "Filhaal-2-Mohabbat", songExt:"mp3")]),
    AlbumStruct(albumName: "Bollywood", albumImage: UIImage(named: "Bollywood"), albumPlaylist: [  SongInfo(songName: "Hawayein", songTitle: "Hawayein",songArtist: "Arijit Singh" ,songImage: "Hawayein", songExt: "mp3"),SongInfo(songName: "Barns Courtney-Fire", songTitle: "Barns Courtney-Fire",songArtist: "Barns Courtney", songImage: "Barns Courtney-Fire", songExt: "mp3"),
        SongInfo(songName: "Yaariyan", songTitle: "Yaariyan", songArtist: "Mohd Irfan",songImage: "Yaariyan", songExt: "mp3")]),
    AlbumStruct(albumName: "Pop", albumImage: UIImage(named: "Pop"), albumPlaylist: [  SongInfo(songName: "Aashiqui Aa Gayi", songTitle: "Aashiqui Aa Gayi", songArtist: "Radhe Shyam",songImage: "Aashiqui Aa Gayi", songExt: "mp3"),
        SongInfo(songName: "Baliye Re - Jersey", songTitle: "Baliye Re - Jersey", songArtist: "Stebin ben",songImage: "Baliye Re - Jersey", songExt: "mp3"),SongInfo(songName: "Brown Munde", songTitle: "Brown Munde", songArtist: "AP Dhillon",songImage: "Brown Munde", songExt: "mp3")]),
       AlbumStruct(albumName: "Romantic", albumImage: UIImage(named: "Romantic"), albumPlaylist: [ SongInfo(songName: "Din Raat", songTitle: "Din Raat", songArtist: "Garry Sandhu",songImage: "Din Raat", songExt: "mp3"),SongInfo(songName: "Jane Wale Laut Kar Tu Aaya Kyon Nahi", songTitle: "Jane Wale Laut Kar Tu Aaya Kyon Nahi", songArtist: "B-Praak,Neha Kakkar",songImage: "Jane Wale Laut Ke Aaya Kyun Nhi", songExt: "mp3"),SongInfo(songName: "Rabb Jane", songTitle: "Rabb Jane", songArtist: "Garry Sandhu",songImage: "Rabb Jane", songExt: "mp3"),
    SongInfo(songName: "Soch Liya", songTitle: "Soch Liya", songArtist: "Radhe Shyam",songImage: "Soch Liya", songExt: "mp3")]),
            AlbumStruct(albumName: "Sad Romantic", albumImage: UIImage(named: "Sad-Romantic"), albumPlaylist:  [SongInfo(songName: "jind Meriye - Jersey", songTitle: "jind Meriye - jersey", songArtist: "Stebin Ben",songImage: "jind Meriye - jersey", songExt: "mp3"),
    SongInfo(songName: "Main Agar Saamne", songTitle: "Main Agar Samne", songArtist: "Abhijit Singh, Alka Yagini",songImage: "Main Agar Samne", songExt: "mp3"),SongInfo(songName: "Mera Dil Bhi Kitna Pagal Hai", songTitle: "Mera Dil Bhi Kitna Pagal Hai", songArtist: "Abhijit Singh, Alka Yagini",songImage: "Mera Dil Bhi Kitna Pagal Hai", songExt: "mp3"),SongInfo(songName: "One Touch", songTitle: "One Touch", songArtist: "Garry Sandhu",songImage: "One Touch", songExt: "mp3")])

    ]

class AlbumViewController: UIViewController, UpdateNewPlaylist{
    func addAlbum(_ newPlaylist: AlbumStruct) {
        albumPlaylistArray.append(newPlaylist)
    }
    
    
@IBOutlet weak var albumCollectionView: UICollectionView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarOfPlaylist()
        setCollectionViewCell()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        AddNewPlaylistViewController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        albumCollectionView.reloadData()
       
    }
    
    
    func setNavBarOfPlaylist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Playlist")
        let leftItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlaylist))
        
       navItem.leftBarButtonItem = leftItem
        navBar.setItems([navItem], animated: false)
    }
    @objc func addPlaylist(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AddNewPlaylistViewController") as! AddNewPlaylistViewController
       
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func pushToPlaylist(_ selectedAlbumIndex:Int){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "PlaylistViewController") as! PlayListViewController
        let selectedPlaylist = albumPlaylistArray[selectedAlbumIndex]
        destination.selectedAlbum = selectedPlaylist
        navigationController?.pushViewController(destination, animated: true)
    }
    func setCollectionViewCell(){
        let nibCell = UINib(nibName: "AlbumCollectionCell", bundle: nil)
        albumCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
    
    
   
}
extension AlbumViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCollectionCell
        
        pushToPlaylist(indexPath.row)
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumPlaylistArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCollectionCell
        
        cell.CoverImageView.image = albumPlaylistArray[indexPath.row].albumImage
        cell.NameLabel.text = albumPlaylistArray[indexPath.row].albumName
        return cell
    }
    
   
}

