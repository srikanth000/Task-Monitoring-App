class Plan
	PLAN = [:free,:premium]

	def self.options
		PLAN.map { |plan| [plan.capitalize,plan]}
	end



end