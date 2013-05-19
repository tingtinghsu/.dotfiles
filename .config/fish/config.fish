echo -e "\033[0;32m"'                                      '"\033[0m"
echo -e "\033[0;32m"'                   ___                '"\033[0m"
echo -e "\033[0;32m"'    ___======____=---=)               '"\033[0m"
echo -e "\033[0;32m"'  /T            \_--===)              '"\033[0m"
echo -e "\033[0;32m"'  [ \ (0)   \~    \_-==)              '"\033[0m"
echo -e "\033[0;32m"'   \      / )J~~    \-=)              '"\033[0m"
echo -e "\033[0;32m"'    \\___/  )JJ~~~   \)               '"\033[0m"
echo -e "\033[0;32m"'     \_____/JJ~~~~~    \              '"\033[0m"
echo -e "\033[0;32m"'     / \  , \J~~~~~     \             '"\033[0m"
echo -e "\033[0;32m"'    (-\)\=|\\\~~~~       L__          '"\033[0m"
echo -e "\033[0;32m"'    (\\)  (\\\)_           \==__      '"\033[0m"
echo -e "\033[0;32m"'     \V    \\\) ===_____   \\\\\\     '"\033[0m"
echo -e "\033[0;32m"'            \V)     \_) \\\\JJ\J\)    '"\033[0m"
echo -e "\033[0;32m"'                        /J\JT\JJJJ)   '"\033[0m"
echo -e "\033[0;32m"'                        (JJJ| \UUU)   '"\033[0m"
echo -e "\033[0;32m"'                         (UU)         '"\033[0m"
echo -e "\033[0;32m"'                                      '"\033[0m"
echo -e "\033[0;32m"'                                      '"\033[0m"

function fish_prompt -d "Write out the prompt"
	printf '%s%s %s %s%s⮀%s%s %s %s%s⮀%s\n❯ ' (set_color -b magenta) (set_color black) (echo $RUBY_VERSION) (set_color -b blue) (set_color magenta) (set_color -b blue) (set_color white) (prompt_pwd) (set_color -b normal) (set_color blue) (set_color normal)
end

function fish_right_prompt -d "Write out the right prompt"
    date "+%H:%M:%S"
end

function c; clear; end
