# load my translation of the Perl modules Number::Spell and
# Lingua::EN::Numericalize (see CPAN)
require 'numeric-english'

# add to_english method to integers
class Integer; include Numeric::English end

a = []

# return the english representation of the given integer if it is less than
# the one stored in memo (otherwise return memo).
inject_proc = proc do |memo, int|
 if int[0] == 0  # test low bit
  memo        # ignore even numbers
 else
  english = int.to_english
  if english < memo
   english
  else
   memo
  end
 end
end

# I'm not sure why I chose these partitions of the problem space. I think it's
# something to do with independent sections of numbers. We group in threes.

# check numbers one to a million
a << (0..1_000_000).inject('zzz', &inject_proc)
# check numbers from a million to a billion
a << (0..1_000).map{|x| x * 1_000_000 + 1 }.inject('zzz', &inject_proc)
# check numbers from a billion to ten billion
a << (0..10).map{|x| x * 1_000_000_000 + 1 }.inject('zzz', &inject_proc)

# this result is a list of words which have to be combined in an interesting
# way that I haven't formalized. Sorry.
p a

__END__
