describe "string shuffle search problem", ->
  it "does linear search properly", ->
    a = "1233456"
    b = "334"
    expect(a.linear_search 0, a.length-1, b).toBe(true)

    a = "abcdedfgdfhaLMMNbcd"
    b = "LMMN"
    expect(a.linear_search 0, a.length-1, b).toBe(true)

  it "detects presence", ->
    a = "abcdedfgdfhaLMMNbcd"
    b = "LMMN"
    expect(a.shuffle_search b).toBe(true)

  it "detects absence", ->
    a = "abcdedfgdhabcd"
    b = "LMMN"
    expect(a.shuffle_search b).toBe(false)

  it "compares better to linear search", ->
    [a,b] = ["",""]

    _.times 9000000*2, ->
      a += String.fromCharCode(Math.floor(Math.random()*25)+97)

    _.times 9800, ->
      b += String.fromCharCode(Math.floor(Math.random()*25)+65)

    a += b
    _.times 1000000*2, ->
      a += String.fromCharCode(Math.floor(Math.random()*25)+97)

    t1 = new Date()
    r1 = a.linear_search 0, a.length-1, b
    t2 = new Date()
    r2 = a.shuffle_search b
    t3 = new Date()
    expect(r1).toBe(true)
    expect(r2).toBe(true)
    console.log "\nTime taken linear- #{(t2 - t1)/1000}s shuffle- #{(t3 - t2)/1000}s"
