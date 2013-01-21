require 'timeout'

module Lazy
  def self.func(lazy = false)
    if lazy
      f = lambda{ (1..Float::INFINITY).lazy.select{ |i| i % 3 == 0 }.first(5) }
    else
      f = lambda{ (1..Float::INFINITY).select{ |i| i % 3 == 0 }.first(5) }
    end
    timeout(1){ f.call }
  end
end

describe Lazy do
  context "lazy" do
    lazy = true
    it { Lazy::func(lazy).should == [3, 6, 9, 12, 15] }
  end

  context "timeout" do
    it { lambda{ Lazy::func }.should raise_error(TimeoutError)  }
  end
end
