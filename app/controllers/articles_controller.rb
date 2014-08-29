class ArticlesController < ApplicationController
	def new
		@article = Article.new  # empty object
	end

	def create
		@article = Article.new(article_params)
		if @article.save 
 			redirect_to @article
 		else
 			#The render method is used so that the @article object is passed back 
 			#to the new template when it is rendered. This rendering is done within 
 			#the same request as the form submission, whereas the redirect_to will 
 			#tell the browser to issue another request.
 			render 'new'  # with and invalid @article
 		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
  		@articles = Article.all
	end

	def edit
		@article = Article.find(params[:id])  
		# shows article in a form with a PATCH articles#update action
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
