String::linear_search = (from,to,sub) ->
  i = from
  j = 0
  max = sub.length

  while (to - i + 1) >= (max-j)
    if @[i] == sub[j]
      i++; j++
    else
      j = 0; i++

    return true if j == max

  return false



# Algorithm description
# Summary: Instead of linearly searching for your substring whether it exists
# if we randomly search segments then it can have a better avg time
# The main recipe for random search will be:
#     1. Start with initial string as first segment
#     2. Choose the middle letter of this segment
#     3. If this letter exists in substring then
#       3.1 Find the bounds around this letter in which you should do linear
#           search
#       3.2 Either your substr is within these bounds and if not then simply
#           divide your segment into two by dividing on the segment you
#           searched on
#     4. If this letter does not exist then simply divide into 2 segments
#     5  If segment has enough length then push them into segment lists
#     6. Got to step1 and randomly choose a segment
String::shuffle_search = (sub) ->
  chars = {}
  _.each sub, (v, i, arr) ->
    chars[v] = {"first": i, "last": i} unless chars[v]
    chars[v]["last"] = i

  segments = []
  segments.push {"begin": 0, "end": @length - 1}
  found = false

  max_len_sub = sub.length
  until segments.length == 0 || found
    randomSegment_i = Math.floor(Math.random() * segments.length)
    segment = segments.splice(randomSegment_i, 1)[0]

    continue if (segment["end"] - segment["begin"]) < max_len_sub

    #randomChar_i=Math.floor(Math.random() *segment["end"])+segment["begin"]
    randomChar_i =  Math.floor((segment["end"] - segment["begin"]) / 2)
    randomChar_i += segment["begin"]
    c = @[randomChar_i]

    if chars[c]
      left_bound = randomChar_i - chars[c]["last"]
      right_bound = randomChar_i + max_len_sub - chars[c]["first"]

      virt_left_bound = if left_bound < segment["begin"]
        segment["begin"]
      else
        if chars[@[left_bound]]
          left_bound - chars[@[left_bound]]["last"]
        else
          left_bound

      virt_left_bound = segment["begin"] if segment["begin"] > virt_left_bound

      virt_right_bound = if right_bound > segment["end"]
        segment["end"]
      else
        if chars[@[right_bound]]
          right_bound + max_len_sub - chars[@[right_bound]]["first"]
        else
          right_bound

      virt_right_bound = segment["end"] if segment["end"] < virt_left_bound
      found = @linear_search virt_left_bound, virt_right_bound, sub
      break if found

      if left_bound - segment["begin"] >= max_len_sub
        segments.push {"begin": segment["begin"], "end": left_bound - 1}

      if segment["end"] - right_bound >= max_len_sub
        segments.push {"begin": right_bound + 1, "end": segment["end"]}

    else
      if randomChar_i - segment["begin"] >= max_len_sub
        segments.push {"begin": segment["begin"], "end": randomChar_i - 1}

      if segment["end"] - randomChar_i >= max_len_sub
        segments.push {"begin": randomChar_i + 1, "end": segment["end"]}

  return found
