clear;
dealer_cards = randi(13, 1, 2);

dealer_card_label = cardnum2str(dealer_cards(1));
fprintf('The dealer draws %s (and hides one card)\n', dealer_card_label);

dealer_cards = min(10, dealer_cards);
dealer_sum = sum(dealer_cards);


my_cards = randi(13, 1, 2);
my_card_label1 = cardnum2str(my_cards(1));
my_card_label2 = cardnum2str(my_cards(2));
fprintf('You show %s and hide %s.\n', my_card_label1, my_card_label2);

my_cards = min(10,my_cards);
my_sum = sum(my_cards);
fprintf('Your total is %d\n', my_sum);

player_input = input('Input h for hit or s for stand: ','s');
if player_input == 's'
    fprintf('You stand.\n\n');
end

while player_input == 'h'
    new_card = randi(13);
    fprintf('You drew a %s\n', cardnum2str(new_card));
    new_card = min(new_card,10);
    my_sum = my_sum + new_card;
    fprintf('Your new total: %d\n', my_sum);
    if my_sum > 21
        fprintf('You bust!\n')
        fprintf('Sorry, you lose.\n')
        player_input = 's';
    else
        player_input = input('Input h for hit or s for stand: ','s');
        if player_input == 's'
            fprintf('You stand.\n');
            
        end
    end
end
fprintf('\n');
if my_sum <= 21
    fprintf('Dealer total is %d\n', dealer_sum);
    if dealer_sum >= 17
        fprintf('Dealer stands\n')
    end
    while dealer_sum < 17
        fprintf('Dealer hits\n')
        new_card = randi(13);
        fprintf('The dealer drew a %s\n', cardnum2str(new_card));
        new_card = min(new_card,10);
        dealer_sum = dealer_sum + new_card;
        fprintf('The dealer''s new total is %d\n',dealer_sum)
        if dealer_sum > 21
            fprintf('Dealer busts, you win!\n')
        elseif dealer_sum >= 17 && dealer_sum <= 21
            fprintf('Dealer stands.\n')
        end
    end

end

if dealer_sum <= 21 && my_sum <= 21
    fprintf('Dealer has %d and you have %d, ', dealer_sum, my_sum);
    if dealer_sum > my_sum
        fprintf('you lose.\n')
    elseif my_sum > dealer_sum
        fprintf('you win!\n')
    else
        fprintf('it''s a tie!\n')
    end
end

% Outputs for each outcome
%
% The dealer busts and you win
%
% The dealer draws 6  of  Diamonds (and hides one card)
% You show 10  of  Hearts and hide 3  of  Clubs.
% Your total is 13
% Input h for hit or s for stand: h
% You drew a 5  of  Hearts
% Your new total: 18
% Input h for hit or s for stand: s
% You stand.
% 
% Dealer total is 14
% Dealer hits
% The dealer drew a Jack  of  Clubs
% The dealer's new total is 24
% Dealer busts, you win!

% You bust and lose
%
% The dealer draws Ace  of  Spades (and hides one card)
% You show 7  of  Diamonds and hide 7  of  Spades.
% Your total is 14
% Input h for hit or s for stand: h
% You drew a 5  of  Clubs
% Your new total: 19
% Input h for hit or s for stand: h
% You drew a Jack  of  Diamonds
% Your new total: 29
% You bust!
% Sorry, you lose.

% You and the dealer stand, and you win
%
% The dealer draws 3  of  Diamonds (and hides one card)
% You show 2  of  Clubs and hide 8  of  Diamonds.
% Your total is 10
% Input h for hit or s for stand: h
% You drew a 8  of  Diamonds
% Your new total: 18
% Input h for hit or s for stand: s
% You stand.
% 
% Dealer total is 9
% Dealer hits
% The dealer drew a 4  of  Hearts
% The dealer's new total is 13
% Dealer hits
% The dealer drew a 4  of  Spades
% The dealer's new total is 17
% Dealer stands.
% Dealer has 17 and you have 18, you win!

% You and the dealer tie
%
% The dealer draws Queen  of  Diamonds (and hides one card)
% You show 7  of  Clubs and hide 6  of  Clubs.
% Your total is 13
% Input h for hit or s for stand: h
% You drew a 2  of  Clubs
% Your new total: 15
% Input h for hit or s for stand: h
% You drew a 4  of  Diamonds
% Your new total: 19
% Input h for hit or s for stand: s
% You stand.
% 
% Dealer total is 19
% Dealer stands
% Dealer has 19 and you have 19, it's a tie!