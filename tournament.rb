# interactive quicksort

gem 'bundler'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

end

def hoo_key(h)
  h.first.first
end

def hoo_value(h)
  h.first.last
end

def a_preferred?(a_key, b_key)
  puts "a) #{a_key}"
  puts "b) #{b_key}"
  system %{open -na "Google Chrome" --args --new-window "#{a_key}"}
  system %{open -na "Google Chrome" --args --new-window "#{b_key}"}
  (gets.chomp =~ /a/).tap { |bool| puts (bool ? "a picked" : "B PICKED") }
end

fn = ARGV[0] || 'input.txt'
options = File.readlines(fn, chomp: true).select { |ln| ln.starts_with(http) }.shuffle
comparisons = 0
options.map! { |a| {a => []} }

while options.length > 1 do
  pairs = options.each_slice(2).to_a
  options = pairs.map do |a, b|
    if a && b
      comparisons += 1
      a_key = hoo_key(a)
      b_key = hoo_key(b)
      win, lose = a_preferred?(a_key, b_key) ? [a, b] : [b, a]
      hoo_value(win) << hoo_key(lose)
      # p win
      win
    else
      a
    end
  end
  p ["ROUND =>", options]
end

puts comparisons

# hasklig
# firacode <=> cascadio-code