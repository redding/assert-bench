require 'assert'

module Tests

  class UnitTests < Assert::Context

    2500.times.each do |i|
      test("test ##{i}"){ 3.times{ pass } }
    end

  end

end
