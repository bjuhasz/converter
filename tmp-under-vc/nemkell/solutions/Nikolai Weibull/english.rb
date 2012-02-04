require 'lisp/format'
ARGV.each{ |arg| puts Lisp.format("~R", arg.to_i) }
