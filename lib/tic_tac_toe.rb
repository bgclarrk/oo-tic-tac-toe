require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def input_to_index(user_input)
        @index = user_input.to_i - 1
        @index
    end

    def move(user_input, player_token = "X")
        @board[user_input.to_i] = player_token
    end

    def position_taken?(user_input)
        @board[user_input] == "X" || @board[user_input] == "O" ? true : false
    end

    def valid_move?(position)
        if self.position_taken?(position) || position < 0 || position > 10
            false
        else
            true
        end
    end

    def turn_count
        occupied_positions = @board.count("X") + @board.count("O")
    end

    def current_player
        self.turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Choose a space between 1 - 9"
        user_input = gets.chomp
        self.input_to_index(user_input)
        binding.pry
        if self.valid_move?(@index)
            if self.current_player == "X"
                @board[@index] = "X"
            else
                @board[@index] = "O"
            end
        else
            puts "Choose a space between 1 - 9"
            user_input = gets.chomp
        end

        self.display_board
    end

    def win?

    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

end