//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Kirill Khristenko on 28.04.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    @IBOutlet var characterImg: UIImageView! {
        didSet {
            characterImg.contentMode = .scaleAspectFit
            characterImg.clipsToBounds = true
        }
    }
    @IBOutlet var label: UILabel!
    
    func configure(with char: Result?) {
        label.text = """
\(char?.name ?? "No information")
\(char?.species ?? "No information")
\(char?.gender ?? "No information")
"""
        fetchImage(from: char?.image)
    }
    private func fetchImage(from url: String?) {
        guard let url = url else { return }
        guard let imageUrl = URL(string: url) else { return }
        ImageManager.shared.fetchImage(from: imageUrl) { data in
            DispatchQueue.main.async {
                self.characterImg.image = UIImage(data: data)
            }
            
        }
    }
}
