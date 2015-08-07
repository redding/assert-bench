DEV_NULL = File.open('/dev/null', 'w')
Assert.configure do |c|
  c.view Assert::DefaultView.new(c, DEV_NULL)
end
