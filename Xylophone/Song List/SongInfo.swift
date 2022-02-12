//
//  SongInfo.swift
//  Xylophone
//
//  Created by SimplyEntertaining on 12/25/21.
//

import Foundation
struct SongInfo:Equatable{
   
    
    var songName:String
    let songTitle:String
    let songArtist:String
    let songImage:String
    let songExt:String
    
    static func == (lhs: SongInfo, rhs: SongInfo) -> Bool {
        return lhs.songName ==  rhs.songName
    }
}
