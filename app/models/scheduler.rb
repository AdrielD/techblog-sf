class Scheduler
	def self.intervals(interval_id)
		return case interval_id
			when "1"
				30.seconds
			when "2"
				1.minutes
			when "3"
				10.minutes
			else
				0.seconds
		end.from_now.utc
	end
end