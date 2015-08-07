require 'assert'

module Tests

  class UnitTests < Assert::Context

    2000.times.each do |i|
      test("test ##{i}"){ 6.times{ pass } }
    end

  end

end
