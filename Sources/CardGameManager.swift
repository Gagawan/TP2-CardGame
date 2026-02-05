import Foundation

final class CardGameManager {
    static let shared = CardGameManager()

    private init() {}

    func run() {
        print("Card Game: War")
        print("=================\n")

        // TODO: Créer deux joueurs
        let player1 = HumanPlayer(name: "Alice")
        let player2 = AIPlayer(name: "Bob")

        // TODO: Créer et lancer une partie
        let game = Game(player1: player1, player2: player2)
        game.play()
    }
}
