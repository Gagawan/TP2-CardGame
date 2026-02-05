final class Deck {

    var cards: [Card] = []

    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
    }

    func shuffle() {
        cards.shuffle()
    }

    func draw() -> Card? {
        return cards.popLast()
    }

    func reset() {
        cards.removeAll()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
    }

}