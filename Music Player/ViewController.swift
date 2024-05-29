//
//  ViewController.swift
//  Music Player
//
//  Created by AKANKSHA on 28/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    var images = ["cover1","cover2","cover3","cover4"]

    override func viewDidLoad() {
        configureSongs()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs(){
        songs.append(Song(name: "Butter", albumName: "Butter", artistName: "BTS", imageName: images[0], trackname: "song1"))
        songs.append(Song(name: "Stay", albumName: "Butter all", artistName: "Justin", imageName: images[1], trackname: "song2"))
        songs.append(Song(name: "1989", albumName: "Butter uu", artistName: "Taylor", imageName: images[2], trackname: "song3"))
        songs.append(Song(name: "Selena", albumName: "Butterii", artistName: "Selena", imageName: images[3], trackname: "song4"))
        songs.append(Song(name: "Butter", albumName: "Butter", artistName: "BTS", imageName: images[0], trackname: "song1"))
        songs.append(Song(name: "Stay", albumName: "Butter all", artistName: "Justin", imageName: images[1], trackname: "song2"))
        songs.append(Song(name: "1989", albumName: "Butter uu", artistName: "Taylor", imageName: images[2], trackname: "song3"))
        songs.append(Song(name: "Selena", albumName: "Butterii", artistName: "Selena", imageName: images[3], trackname: "song4"))
        songs.append(Song(name: "Butter", albumName: "Butter", artistName: "BTS", imageName: images[0], trackname: "song1"))
        songs.append(Song(name: "Stay", albumName: "Butter all", artistName: "Justin", imageName: images[1], trackname: "song2"))
        songs.append(Song(name: "1989", albumName: "Butter uu", artistName: "Taylor", imageName: images[2], trackname: "song3"))
        songs.append(Song(name: "Selena", albumName: "Butterii", artistName: "Selena", imageName: images[3], trackname: "song4"))
    }
    
    
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else{
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

