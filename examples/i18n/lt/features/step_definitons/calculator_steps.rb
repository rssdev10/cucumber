# encoding: utf-8
require 'spec/expectations'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber/formatters/unicode'
require 'calculator'

Before do
  @calc = Calculator.new
end

After do
end

Given "aš įvedžiau $n į skaičiuotuvą" do |n|
  @calc.push n.to_i
end

When /aš paspaudžiu "(\w+)"/ do |op|
  @result = @calc.send op
end

Then /rezultatas ekrane turi būti (.*)/ do |result|
  @result.should == result.to_f
end
