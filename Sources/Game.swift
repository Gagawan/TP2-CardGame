final class Game {

    var player1: Player
    var player2: Player
    var deck: Deck

    var round: Int = 0

    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.deck = Deck()
    }

    func dealCards() {
        print("Dealing cards...")
        print("\(player1.name) receives 26 cards.")
        print("\(player2.name) receives 26 cards.")
        deck.shuffle()
        for _ in 0..<26 {
            if let card1 = deck.draw() {
                player1.receiveCard(card1)
            }
            if let card2 = deck.draw() {
                player2.receiveCard(card2)
            }
        }
    }

    func playCard() {

        guard let card1 = player1.playCard(), let card2 = player2.playCard() else {
            return
        }

        print("\(player1.name) plays: \(card1.description)")
        print("\(player2.name) plays: \(card2.description)")

        if card1 > card2 {
            player1.score += 1
            print("\(player1.name) wins the round!")
        } else if card2 > card1 {
            player2.score += 1
            print("\(player2.name) wins the round!")
        } else {
                print("War! Each player plays 3 cards...")
            for _ in 0..<3 {
                if player1.playCard() == nil || player2.playCard() == nil {
                    break
                }
            }
        }

        print("Scores: \(player1.name) - \(player1.score), \(player2.name) - \(player2.score)\n")
    }

    func play() {
        dealCards()
        while !player1.hand.isEmpty && !player2.hand.isEmpty {
            round += 1
            print("--- Round \(round) ---")
            playCard()
        }
        print("\nGame Over!")
        print("Winner: \(player1.score > player2.score ? player1.name : player2.name) with score \(max(player1.score, player2.score))")
    }

}