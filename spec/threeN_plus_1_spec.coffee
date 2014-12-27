describe "3n + 1 problem", ->
  it "instantiates proper value for ascending range", ->
    range = new Range 1, 999999
    expect(range.start).toEqual(1)
    expect(range.end).toEqual(999999)

  it "instantiates proper value for descending range", ->
    range = new Range 999999, 1
    expect(range.start).toEqual(1)
    expect(range.end).toEqual(999999)

  it "returns proper value for 210, 201", ->
    range = new Range 210, 201
    expect(range.max_cycle_length()).toEqual(89)

  it "returns proper value for 113383, 113383", ->
    range = new Range 113383, 113383
    expect(range.max_cycle_length()).toEqual(248)

  # it "returns proper value for 1, 999999", ->
  #   range = new Range 1,999999
  #   expect(range.max_cycle_length()).toEqual(525)
