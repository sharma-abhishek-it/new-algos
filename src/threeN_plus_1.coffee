class Range
  constructor: (begin, end) ->
    @start = if begin > end then end   else begin
    @end   = if begin > end then begin else end

  max_cycle_length: ->
    max_cycle_length = 0
    prof_start = new Date

    n = @start
    while n <= @end
      num = n
      count = 0

      while num != 1
        count += 1
        if (num & 1) == 1
          num = (3 * num) + 1
        else
          num = num / 2

      count += 1
      max_cycle_length = count if count > max_cycle_length

      n += 1

    prof_end = new Date
    # console.log "\nTime taken to run - #{(prof_end - prof_start)/1000}s\n"
    return max_cycle_length
