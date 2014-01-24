module DetailsHelper
	def parse_height(height)
    return nil if height.nil? || height == 0
    parsed_height = {feet: 0, inches: 0}
    until height < 12
      parsed_height[:feet] += 1
      height -= 12
    end
    parsed_height[:inches] = height
    parsed_height[:feet].to_s + "' " + parsed_height[:inches].to_s + "\""
	end
end