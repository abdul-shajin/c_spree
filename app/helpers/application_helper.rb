module ApplicationHelper
	def sting_to_underscore(string)
	    string.downcase.gsub(/\s+/,'_')
	end
end
