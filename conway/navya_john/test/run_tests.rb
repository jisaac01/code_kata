Dir.glob('./*').each do |filename|
  require_relative filename
end
