require_relative '../src/division'

describe "division" do
  it "caluclates correct value for arbitrary division" do
    expect(12778.div_by 7).to eq(12778/7)
    expect(983426.div_by 452).to eq(983426/452)
    expect(17630.div_by 10).to eq(17630/10)
    expect(999999.div_by 876544).to eq(999999/876544)
  end

  it "calculates correct value for corner case of quotient 0" do
    expect(1.div_by 2).to eq(1/2)
    expect(3.div_by 5).to eq(3/5)
  end

  it "calculates correct value for corner case of remainder 0" do
    expect(2.div_by 2).to eq(2/2)
    expect(15.div_by 5).to eq(15/5)
  end
end
