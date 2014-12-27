class Fixnum
  def div_by(a)

    b = self
    a_sum_till_now,a_times_2x,last_a_times_2x = 0,a,a
    count,a_X,last_a_X = 0,1,1
    looper = 0


    while a_sum_till_now + a_times_2x <= b do

      last_a_times_2x, last_a_X = a_times_2x, a_X

      a_times_2x  = a_times_2x  << 1          # (a)+(a), (a+a)+(a+a), (a+a+a+a)+(a+a+a+a) & so on....
      a_X         = a_X         << 1          #    2          4                8  no. of a’s summed up above

      if a_sum_till_now + a_times_2x > b

        a_sum_till_now  += last_a_times_2x
        count           += last_a_X           # no. of a’s being added incrementally, this is the final result after loop end

        a_times_2x, last_a_times_2x  = a, a
        a_X,       last_a_X   = 1, 1
      end

      # looper += 1
    end


    # puts "Loop executed #{looper} times"

    return count
  end
end
