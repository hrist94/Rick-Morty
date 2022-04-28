//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Kirill Khristenko on 28.04.2022.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var character: Result?

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.layer.cornerRadius = 15
        setupImage(with: character?.image)
        setupLabel(with: character)
    }
    private func setupImage(with url: String?) {
        guard let url = url else { return }
        guard let imageUrl = URL(string: url) else { return }
        ImageManager.shared.fetchImage(from: imageUrl) { data in
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: data)
            }
        }
    }
    private func setupLabel(with character: Result?) {
        guard let character = character else { return }
        infoLabel.text = """
Имя: \(character.name ?? "No information")
Раса: \(character.species ?? "No information")
Пол: \(character.gender ?? "No information")
Статус: \(character.status ?? "No information")
Местоположение: \(character.location?.name ?? "No information")
Кол-во эпизодов: \(character.episode?.count ?? 1)
"""
    }
}
