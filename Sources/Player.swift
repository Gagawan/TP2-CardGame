protocol Player: AnyObject {
    
    var name: String { get }
    var hand: [Card] { get set }
    var score: Int { get set }
    
    func playCard() -> Card?

    func receiveCard(_ card: Card)

}

final class HumanPlayer: Player {

    var name: String
    var hand: [Card] = []
    var score: Int = 0

    init(name: String) {
        self.name = name
    }

    func playCard() -> Card? {
        return hand.popLast()
    }

    func receiveCard(_ card: Card) {
        hand.append(card)
    }
}

final class AIPlayer: Player {

    var name: String
    var hand: [Card] = []
    var score: Int = 0

    init(name: String) {
        self.name = name
    }

    func playCard() -> Card? {
        return hand.popLast()
    }

    func receiveCard(_ card: Card) {
        hand.append(card)
    }
}