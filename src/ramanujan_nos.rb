def ramanujan_1(n)
  nos = []
  n.times do |a|
    n.times do |b|
      n.times do |c|
        n.times do |d|
          ary = [a,b,c,d]
          next if ary.uniq.length < 4

          no = a**3 + b**3
          nos << no if no == c**3 + d**3
        end
      end
    end
  end

  return nos.uniq
end

def ramanujan_2(n)
  pairs = []
  (1..n).each do |i|
    (i..n).each do |j|
      pairs << [i,j]
    end
  end

  nos = {}
  pairs.each do |p|
    num = p.first**3 + p.last**3
    nos[num] = nos[num].nil? ? false : true
  end
  final_nos = nos.select {|_,v| v == true }
  return final_nos.keys.uniq
end
