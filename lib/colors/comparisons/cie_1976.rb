require_relative "../conversions"

module Colors
  module Comparisons
    class Cie1976
      def self.compare(rgb_a, rgb_b)
        a = Conversions::Lab.new(rgb_a)
        b = Conversions::Lab.new(rgb_b)

        diference = distance(a.l, b.l) + distance(a.a, b.a) + distance(a.b, b.b)
        return Math.sqrt(diference)
      end

      def self.distance(a, b)
        number = (a - b)
        return number ** 2
      end
    end
  end
end
