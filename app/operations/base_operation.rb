module BaseOperation

	def run!(data, params)
		@data = data
		@params = params

		init_variables
	end

	def init_variables; end
end