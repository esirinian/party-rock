//
//  ViewController.swift
//  party-rock
//
//  Created by Eric Sirinian on 1/10/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/o_1l1pUmY6s/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=i0KFgUHeO4TG935BjdRAxLc7vBw", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/o_1l1pUmY6s\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Booty Man Costume")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/Xov2qZQbOuU/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=0O2U762cmkGyZeEzbMgRfBlqBUs", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Xov2qZQbOuU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Shufflebot Costume Presale")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/gZIqW92GaTQ/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=fARxhcG5ATRan8SQDhHw-FO6BvY", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Redfoo's Party Rock Mansion")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/8CMJrGYT1X0/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=LLwR-MOqUnY9quezEWV_IQtZmA0", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8CMJrGYT1X0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Mansion Diaries: Marquee")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/CdLhdrNgGu4/hqdefault.jpg?custom=true&w=336&h=188&stc=true&jpg444=true&jpgq=90&sp=68&sigh=dnIONCMFhrQ1xjDafKOy90j2sF4", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's get Ridiculous")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

