require 'ruby-prof'

class Range
  def max_cycle_length
    start = if self.begin > self.end then self.end else self.begin end
    last  = if self.begin > self.end then self.begin else self.end end

    range = (start..last)

    startOdd = 5
    memoizedLengths = {1 => 1}
    twos = 4
    max = self.begin > self.end ? self.begin : self.end
    while startOdd < (max * max) do
      memoizedLengths[startOdd] = 1 + twos + 1
      startOdd = (startOdd << 2) + 1
      twos += 2
    end

    count = 1
    startTwos = 2
    while startTwos < (max * max) do
      memoizedLengths[startTwos] = count + 1
      startTwos = startTwos << 1
      count += 1
    end

    # RubyProf.start
    max_cycle_length = 0
    # prof_start = Time.new
    range.each do |n|
      num = n
      count = 0
      # sublengths = {}
      while memoizedLengths[num].nil? do
      # while num != 1 do
        # sublengths[num] = count
        count += 1
        if (num & 1) == 1
          num = (num << 1) + num + 1
        else
          num = num >> 1
        end
      end
      # count += 1
      count += memoizedLengths[num]
      # sublengths.each {|k,v| memoizedLengths[k] = count - v }
      memoizedLengths[n] = count
      max_cycle_length = count if count > max_cycle_length
    end
    # result = RubyProf.stop
    # printer = RubyProf::FlatPrinter.new(result)
    # printer.print(STDOUT)
    # prof_end = Time.new
    # puts "Time taken - #{prof_end - prof_start}"
    return max_cycle_length
  end
end

# puts (1..999999).max_cycle_length
# puts (999999..1).max_cycle_length
