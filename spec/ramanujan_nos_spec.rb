require_relative '../src/ramanujan_nos'

describe "ramanujan nos" do
  xit "executes worst case properly" do
    prof_start = Time.new
    ramanujan_1 50
    prof_end = Time.new
    puts "\n Ramanujan n^4 time - #{prof_end - prof_start}"
  end

  it "executes n^2*log(n) properly" do
    expect(ramanujan_1 25).to eq(ramanujan_2 25)
  end

  it "executes n^2*log(n) much faster" do
    prof_start = Time.new
    ramanujan_2 500
    prof_end = Time.new
    puts "\n Ramanujan n^2*log(n) time - #{prof_end - prof_start}"
  end

end
