class ArticlesController < ApplicationController
  #security: authentification
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  #display all the articles
  def index
    @articles = Article.all
  end

  #display the article by param
  def show
    @article = Article.find(params[:id])
  end

  #instance of article object
  def new
    @article = Article.new
  end

  #instantiates new article with values : title and body and attemps to save it. CREATE AND SAVE
  
  def create 
    @article = Article.new(article_params)

    if @article.save #if success
      redirect_to @article #redirection to the article's page with it id param
    else #sinon
      render :new, status: :unprocessable_entity #redisplays the form by rendering the view page with status code error 422
    end
  end
  
    #display edit form of the article fetched from db
    def edit
      @article = Article.find(params[:id])
    end

     #update action : re-fetchs th article from db
     def update
      @article = Article.find(params[:id])
  
      if @article.update(article_params)#if success
        redirect_to @article
      else #re display the form with error message
        render :edit, status: :unprocessable_entity
      end
    end

    #delete an article
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
  
      redirect_to root_path, status: :see_other #it redirects the browser to the root path with status code 303 See Other.
    end

    private
    def article_params
      params.require(:article).permit(:title, :body, :status, :review)
    end

end
