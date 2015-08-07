DEV_NULL = File.open('/dev/null', 'w')
Assert.configure do |c|
  c.view Assert::View::DefaultView.new(DEV_NULL, c)
end
