# a module is a collections of functions
defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

      for suit <- suits, value <- values do
          "#{value} of #{suit}"
      end
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def shuffle(deck) do # shuffle/1 -> Arity is the number of parameters
    Enum.shuffle(deck)
  end

  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
