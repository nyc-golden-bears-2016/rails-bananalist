class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: 'Article was Succesfuly Created'}
        format.json {render :show, status: :created, location: @article}
      else
        format.html {render :new}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html {redirect_to @article, notice: 'Article was Succesfuly Updated'}
        format.json {render :show, status: :ok, location: @article}
      else
        format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @category = @article.category
    @article.destroy
    redirect_to category_path(@category), notice: 'Article was Succesfuly Deleted'
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :article_id, :category_id)
  end
end
