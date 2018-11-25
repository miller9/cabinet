class DocsController < ApplicationController

	def index
	end

	def show
	end

	def new
		# creating the instance of a new document
		@doc = Doc.new
	end

	def create
		# When we create a document, we're creating its parameters (title and content)
		@doc = Doc.new(doc_params)
		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
	end

	private
		def find_doc
		end

		def doc_params
			# defining doc_params -> :doc=Doc Model we created earlier and PERMIT the 2 attributes
			params.require(:doc).permit(:title, :content)
		end

end
