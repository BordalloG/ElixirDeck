# a module is a collections of functions
defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

      for suit <- suits, value <- values do
          "#{value} of #{suit}"
      end
  end

  @doc """
    Determines whether a deck contains a given card

    ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains? deck, "Ace of Spades"
        true

        iex> deck = Cards.create_deck
        iex> Cards.contains? deck, "Jack of Ace"
        false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, _deck}  = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
   Returns a list of strings representing a deck of playing cards from a file
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
  Save a list of strings representing a deck in binary into a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

@doc """
Shuffle the cards from a `deck`
"""
  def shuffle(deck) do # shuffle/1 -> Arity is the number of parameters
    Enum.shuffle(deck)
  end

  @doc """
  Create a deck, shuffle the deck and deal a hand with the `hand_size`.
  Returning the hand and the remainder of the deck.
"""
  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
