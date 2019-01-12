

src = IO.read('./../docker/red_amber_green.rb')
rgb = eval(src)

colours = %w( red amber green )
colours.each do |colour|
  Dir.glob("#{colour}/**").each do |filename|
    stdout = IO.read(filename)
    expected = colour
    actual = rgb.call(stdout,'',0)
    if actual.to_s == expected
      print '.'
    else
      puts "expected:#{expected}: actual:#{actual}: filename:#{filename}:"
    end
  end
end
puts
