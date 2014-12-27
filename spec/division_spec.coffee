_ = require('./lodash')

describe "fast division", ->
  it "caluclates correct value for arbitrary division", ->
    expect(div_by 12778,  7).toEqual(parseInt(12778/7))
    expect(div_by 983426, 452).toEqual(parseInt(983426/452))
    expect(div_by 17630,  10).toEqual(parseInt(17630/10))
    expect(div_by 999999, 876544).toEqual(parseInt(999999/876544))

  it "calculates correct value for corner case of quotient 0", ->
    expect(div_by 1, 2).toEqual(parseInt(1/2))
    expect(div_by 3, 5).toEqual(parseInt(3/5))

  it "calculates correct value for corner case of remainder 0", ->
    expect(div_by 2,  2).toEqual(parseInt(2/2))
    expect(div_by 15, 5).toEqual(parseInt(15/5))
