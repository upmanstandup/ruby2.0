describe "Spec test Enum size and Range size" do
  context "Range size check" do
    it { (1..5).size.should == 5 }
  end
  context "Range size check" do
    it { [1,2,3,4,5].size.should == 5 }
  end
end
