class ArticlesController < ApplicationController
  layout "admin"

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    @all_articles = Array.new

    @articles.each do |article|
      article_admin = Admin.find(article.admin_id).name
      article_category = Category.find(article.category_id).name
      article_info = {:article => article, :article_admin => article_admin, :article_category => article_category}
      @all_articles.push(article_info)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article_admin = Admin.find(@article.admin_id).name
    @article_category = Category.find(@article.category_id).name

    puts @article_admin
    puts @article_category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
