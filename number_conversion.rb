class Converter

  def initialize(amount)
    @amount = amount
    @dollars = amount.divmod(1)[0]
    @cents = amount.divmod(1)[1].round(2)
  end

  def convert_amount_to_words
    if @amount < 0
      'Please enter a positive amount'
    elsif @amount == 0
      'Zero dollars'
    else
      @segments = create_number_segments
      if @segments[0] == 0 && @segments.length == 1
        convert_cents.sub("and ", "")
      else
        convert_dollars_and_cents
      end
    end
  end

  def create_number_segments
    number_segments = []
    while @dollars/1000 > 0
      number_segments.unshift(@dollars%1000)
      @dollars /= 1000
    end
    number_segments.unshift(@dollars)
    number_segments
  end

  def convert_cents
    if @cents == 0
      'dollars'
    else
      cents_split = @cents.to_s.split(".")
      "and #{cents_split[1]}/100 dollars"
    end
  end

  def convert_dollars_and_cents
    ones = %w(one two three four five six seven eight nine)
    teens = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen
                    eighteen nineteen)
    tens = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
    illions = %w(thousand million billion trillion)

    words = []

    while @segments.length > 0
      segment = @segments[0]

      while segment > 0
        if segment/100 > 0
          words << "#{ones[segment/100-1]} hundred"
          segment -= segment/100*100
        elsif segment/10 > 0
          if segment/10 == 1
            words << "#{teens[segment%10-1]}"
            segment = 0
          else
            words << ["#{tens[segment/10-1]}"]
            segment -= segment/10*10
            words[-1] << "-#{ones[segment-1]}"
            words[-1] = words[-1].join("")
            segment = 0
          end
        else
          words << "#{ones[segment-1]}"
          segment = 0
        end
      end

      if @segments.length > 1
        words << "#{illions[@segments.length-2]}"
      end
      @segments.shift
    end
    words << convert_cents
    words
    words.join(" ").capitalize
  end
end


