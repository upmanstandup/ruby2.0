module FooFoo
  def sayhi
    super + "2"
  end
end

class BarBar
  def sayhi
    "hello"
  end
end

class FooInc < BarBar
  include FooFoo
  def sayhi
    super + "1"
  end
end

class FooPre < BarBar
  prepend FooFoo
  def sayhi
    super + "1"
  end
end

describe "FooBar Prepend Include prior" do
  context "BarPrependFoo" do
    it { FooInc.new.sayhi.should == "hello21" }
    it { FooPre.new.sayhi.should == "hello12" }
  end
end

