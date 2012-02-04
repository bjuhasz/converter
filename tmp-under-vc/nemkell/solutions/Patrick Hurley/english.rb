class Integer
  DIVISORS = [[100,  ''],
              [10,   'hundred'],
              [1000, 'thousand'],
              [1000, 'million'],
              [1000, 'billion'],
              [1000, 'trillion'],
              [1000, 'quadrillion'],
              [1000, 'quintillion'],
              [1000, 'sextillion'],
              [1000, 'septillion'],
              [1000, 'octillion'],
              [1000, 'nonillion'],
              [1000, 'decillion'],
              [1000, 'undecillion'],
              [1000, 'duodecillion'],
              [1000, 'tredecillion'],
              [1000, 'quattuordecillion'],
              [1000, 'quindecillion'],
              [1000, 'sexdecillion'],
              [1000, 'septendecillion'],
              [1000, 'octodecillion'],
              [1000, 'novemdecillion'],
              [1000, 'vigintillion'],
              [1000, 'unvigintillion'],
              [1000, 'duovigintillion'],
              [1000, 'trevigintillion'],
              [1000, 'quattuorvigintillion'],
              [1000, 'quinvigintillion'],
              [1000, 'sexvigintillion'],
              [1000, 'septvigintillion'],
              [1000, 'octovigintillion'],
              [1000, 'novemvigintillion'],
              [1000, 'trigintillion'],
              [1000, 'untrigintillion'],
              [1000, 'duotrigintillion'],
              [1000, 'tretrigintillion'],
              [1000, 'quattuortrigintillion'],
              [1000, 'quintrigintillion'],
              [1000, 'sextrigintillion'],
              [1000, 'septtrigintillion'],
              [1000, 'octotrigintillion'],
              [1000, 'novemtrigintillion'],
              [1000, 'quadragintillion'],
              [1000, 'unquadragintillion'],
              [1000, 'duoquadragintillion'],
              [1000, 'trequadragintillion'],
              [1000, 'quattuorquadragintillion'],
              [1000, 'quinquadragintillion'],
              [1000, 'sexquadragintillion'],
              [1000, 'septquadragintillion'],
              [1000, 'octoquadragintillion'],
              [1000, 'novemquadragintillion'],
              [1000, 'quinquagintillion'],
              [1000, 'unquinquagintillion'],
              [1000, 'duoquinquagintillion'],
              [1000, 'trequinquagintillion'],
              [1000, 'quattuorquinquagintillion'],
              [1000, 'quinquinquagintillion'],
              [1000, 'sexquinquagintillion'],
              [1000, 'septquinquagintillion'],
              [1000, 'octoquinquagintillion'],
              [1000, 'novemquinquagintillion'],
              [1000, 'sexagintillion'],
              [1000, 'unsexagintillion'],
              [1000, 'duosexagintillion'],
              [1000, 'tresexagintillion'],
              [1000, 'quattuorsexagintillion'],
              [1000, 'quinsexagintillion'],
              [1000, 'sexsexagintillion'],
              [1000, 'septsexagintillion'],
              [1000, 'octosexagintillion'],
              [1000, 'novemsexagintillion'],
              [1000, 'septuagintillion'],
              [1000, 'unseptuagintillion'],
              [1000, 'duoseptuagintillion'],
              [1000, 'treseptuagintillion'],
              [1000, 'quattuorseptuagintillion'],
              [1000, 'quinseptuagintillion'],
              [1000, 'sexseptuagintillion'],
              [1000, 'septseptuagintillion'],
              [1000, 'octoseptuagintillion'],
              [1000, 'novemseptuagintillion'],
              [1000, 'octogintillion'],
              [1000, 'unoctogintillion'],
              [1000, 'duooctogintillion'],
              [1000, 'treoctogintillion'],
              [1000, 'quattuoroctogintillion'],
              [1000, 'quinoctogintillion'],
              [1000, 'sexoctogintillion'],
              [1000, 'septoctogintillion'],
              [1000, 'octooctogintillion'],
              [1000, 'novemoctogintillion'],
              [1000, 'nonagintillion'],
              [1000, 'unnonagintillion'],
              [1000, 'duononagintillion'],
              [1000, 'trenonagintillion'],
              [1000, 'quattuornonagintillion'],
              [1000, 'quinnonagintillion'],
              [1000, 'sexnonagintillion'],
              [1000, 'septnonagintillion'],
              [1000, 'octononagintillion'],
              [1000, 'novemnonagintillion'],
              [1000, 'centillion'],
             ]

  ENGLISH_MAP = {
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
         90 => 'ninety',
  }

  ENGLISH_TEXT = {
    :and   => 'and',
    :comma => ',',
    :zero  => 'zero',
    :minus => 'minus'
  }

  def Integer.insert_and?(number, result, recurse)
    number > 0 &&
    result.empty? &&
    !recurse && !ENGLISH_TEXT[:and].empty?
  end

  def Integer.insert_comma?(index, result)
    (index >= 2) &&
    (
      !ENGLISH_TEXT[:and].empty? &&
      !result.empty? &&
      !result[/^#{Regexp.escape(ENGLISH_TEXT[:and])}/]
    ) ||
    (
      ENGLISH_TEXT[:and].empty? &&
      result[/\s\S+$/]
    )
  end

  def Integer.to_en(number, recurse=false)
    result = ''
    DIVISORS.each_with_index do |(divisor, name), index|
      break unless number > 0
      remainder = number % divisor
      number /= divisor
      next if (remainder == 0)

      # check for special case 1100...2000
      # if (1 == number && (1..9) === remainder && index == 1 && !recurse)

      # check for special case 1100...1999 skipping [2-9]0..
      if ((1..9) === number && (1..9) === remainder && index == 1 && !recurse)
        remainder += number * 10
        number = 0
      end

      part = ''
      case remainder
        when 1..19
          part = ENGLISH_MAP[remainder]
        when 20..99
          units = remainder % 10
          part = ENGLISH_MAP[remainder - units]
          part += '-' + ENGLISH_MAP[units] if (units != 0)
        else
          # Recurse
          part = Integer.to_en(remainder, true)
      end

      # the following section is complicated by supporting
      # commas and ands
      full_part = ''
      if insert_and?(number, result, recurse)
        full_part += ENGLISH_TEXT[:and] + ' '
      end

      full_part += part
      full_part += ' ' + name unless name.empty?

      if insert_comma?(index, result)
        full_part += ENGLISH_TEXT[:comma]
      end

      full_part += ' ' + result unless result.empty?
      result = full_part
    end
    result
  end

  def to_en
    Integer.to_en(self)
  end
end

# assumptions based upon US number to words algorithm
#  - the first digit of the number in question must begin with
#    the lowest number name alphabetically (this is a pretty good
#    prune all by itself
#
#  - the number in question must be a member of the lowest
#    divisor name (alphabetically)
#

# we know the number must be eight somethings
#number = EnglishNumber::ENGLISH_MAP.values.sort
#puts number.first

# ok so we must be in the eight billions
#names = EnglishNumber::DIVISORS.map { |d,name| name }
#names = names.reject { |n| n.size == 0 }
#names = names.sort
#puts names.first

# now we re-apply the same rules as above, but
# not forgetting to "odd" rule (meaning we cannot
# use eight on the final digit
# now we know the last digit will be a five
#number = EnglishNumber::ENGLISH_MAP.to_a.reject { |k,n| k % 2 == 0 }
#number = number.map { |k,name| name }
#number.sort
#puts number.first

# So putting it all together we check all entries in
# our heavily pruned tree of choices
# numbers ending in 5 and having a combination of
# 0 and 8's

def try_some_numbers
  lowest = 'zzzz'
  number = 5
  prefix = 0
  while number < 10_000_000_000
    number = (prefix.to_s(2).gsub(/1/, '8') + '5').to_i
    name = number.to_en
    if name < lowest
      lowest = name
    end
    prefix += 1
  end
  puts lowest
end

puts "Using both commas and 'and'"
try_some_numbers

puts "\nRepeat without 'and' or comma"
Integer::ENGLISH_TEXT[:comma] = ''
Integer::ENGLISH_TEXT[:and] = ''
try_some_numbers
