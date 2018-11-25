class DocsController < ApplicationController

	# params are going to be used on: show, edit, update, destroy
	before_action :find_doc, only: [:show, :edit, :update, :destroy]


	def index
		# defining @docs, order in Descending order
		@docs = Doc.all.order("created_at DESC")
	end

	def show
	end

	def new
		# creating the instance of a new document
		# @doc = Doc.new
		# Only current user can create the doc or the doc is being created from the user with docs built.
		@doc = current_user.docs.build
	end

	def create
		# When we create a document, we're creating its parameters (title and content)
		# @doc = Doc.new(doc_params)
		# Just the current user with respective params
		@doc = current_user.docs.build(doc_params)
		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	def destroy
		# we find the doc to be destroyed and redirect to all docs
		@doc.destroy
		redirect_to docs_path
	end

	private
		# params are going to be used on: show, edit, update, destroy
		def find_doc
			# Find by the parameters Id
			@doc = Doc.find(params[:id])
		end

		def doc_params
			# defining doc_params -> :doc=Doc Model we created earlier and PERMIT the 2 attributes
			params.require(:doc).permit(:title, :content)
		end

end
