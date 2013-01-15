module KeywordParam
  def self.func(hoge: "str", fuga: 123)
    "hoge: #{hoge}, fuga: #{fuga}"
  end
end

describe KeywordParam do
  context "default" do
    it { KeywordParam::func.should == "hoge: str, fuga: 123" }
  end

  context "argument" do
    it { KeywordParam::func(hoge: "hhh").should == "hoge: hhh, fuga: 123" }
    it { KeywordParam::func(fuga: 33).should == "hoge: str, fuga: 33" }
  end

  context "argument error" do
    it { lambda{ KeywordParam::func("abc", 33) }.should raise_error(ArgumentError) }
    it { lambda{ KeywordParam::func(no_param: "aaa") }.should raise_error(ArgumentError) }
  end
end
