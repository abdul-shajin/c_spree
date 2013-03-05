module ApplicationHelper
	def sting_to_hiphen(string)
	    string.downcase.gsub(/\s+/,'-')
	end
end
