require "json"

ARGF.each_line do |line|
  result = JSON.parse(line)

  if result["gates"].nil?
    puts "No solutions."
    exit(0)
  end

  gates = result.fetch("gates")
  gates.each do |type, left, right|
    name = { 0 => "and", 1 => "or", 2 => "inverter" }.fetch(type)

    if name == "inverter"
      puts "#{name}: #{left}"
    else
      puts "#{name}: #{left}, #{right}"
    end
  end
end
