# Timothy Byrd's solution, which can be found at: 
# http://www.rubyquiz.com/quiz25.html

=begin
While we normally write numbers using Arabic (or since Quiz #22,
Roman) numerals, numbers can also be written out as English phrases.

For example:

    7 == seven (the hard way)
    42 == forty-two (a very important number)
    2001 == two thousand and one (a space odyssey)
    1999 ==  (party like it's) nineteen hundred and ninety-nine


So the quiz is a problem from a Pi Mu Epsilon (US national math club)
newsletter:


"When the integers 1 to 10_000_000_000 are written in the English
language, then sorted as strings, which odd number appears first in
the list?"

- Create Ruby code to translate a number to it's English language form.

- Determine programatically which odd number in 1..10_000_000_000
would sort first if written in English. (Brute force is the obvious
solution, but the computer may have to think about it...)

- Would the answer change for a larger range of values, say 10**30?

- Do French and German Rubyists get a different answer than the
Americans?

=end

module EnglishNumerals

    Numbers = {
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety'
        }

    AmExponents = {
        3 => 'thousand',
        6 => 'million',
        9 => 'billion',
        12 => 'trillion',
        15 => 'quadrillion',
        18 => 'quintillion',
        21 => 'sexillion',
        24 => 'septillion',
        27 => 'octillion',
        30 => 'nonillion',
        33 => 'decillion',
        36 => 'undecillion',
        39 => 'duodecillion',
        42 => 'tredecillion',
        45 => 'quattuordecillion',
        48 => 'quindecillion',
        51 => 'sexdecillion',
        54 => 'septendecillion',
        57 => 'octodecillion',
        60 => 'novemdecillion',
        63 => 'vigintillion',
        66 => 'unvigintillion',
        69 => 'duovigintillion'
        }

    EurExponents = {
        3 => 'thousand',
        6 => 'million',
        9 => 'milliard',
        12 => 'billion',
        15 => 'billiard',
        18 => 'trillion',
        21 => 'trilliard',
        24 => 'quadrillion',
        27 => 'quadrilliard',
        30 => 'quintillion',
        33 => 'quintilliard',
        36 => 'sextillion',
        39 => 'sextilliard',
        42 => 'septillion',
        45 => 'septilliard',
        48 => 'octillion',
        51 => 'octilliard',
        54 => 'noventillion',
        57 => 'noventilliard',
        60 => 'decillion',
        63 => 'decilliard',
        66 => 'undecillion',
        69 => 'undecilliard'
        }

     Max_exponent = 69

     def self.to_English_base(val, include_and = false)

        result = ''

        sep = include_and ? ' and ' : ' ';

        if val >= 100 then
            v1 = val / 100
            result << ' ' << Numbers[v1] << ' hundred'
            val -= v1 * 100
        end

        if val >= 20 then
            v1 = val / 10
            result << sep << Numbers[v1 * 10]
            val -= v1 * 10
            sep = '-'
        end

        if val > 0 then
            result << sep << Numbers[val]
        end

        result
    end

    def self.to_English(val, eu_names = true, include_and = true)
        val = val.to_i.abs

        return "zero" if val == 0

        include_and = false if val <= 100

        exp_hash = eu_names ? EurExponents : AmExponents

        exp = Max_exponent

        result = ''

        while val > 0
            n = 10 ** exp

            if exp == 3 && val >= 1100 && val < 2000 then
                v1 = val / 100
                val -= v1 * 100
                result << to_English_base(v1, false) << ' hundred'
            elsif val >= n
                v1 = val / n
                val -= v1 * n
                result << to_English_base(v1, exp == 0 && include_and)
                if exp > 0 then
                    result << ' ' << exp_hash[exp]
                end
            end

            exp -= 3
        end

        result.strip
    end
end

