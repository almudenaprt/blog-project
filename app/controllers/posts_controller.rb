class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]  #Antes de accionar estos 4 métodos le ordenamos que
  #se lleve a cabo el método set_post, que coge el post en concreto (según su ID) para luego realizar con él lo que esté
  #definido en el método en concreto (show, edit, etc.). Si no estuviera el "only" se ejecutaría para todos los métodos 
  #están por debajo

  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])  # Para que muestre los artículos en orden descendiente, del último
    # que se creó al primero. .page(params[:page] para hacer que se paginen según indicamos
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new    #Definimos esta variable para que se muestre el comentario que se acaba de escribir
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def user_posts
    @user = User.find_by(username: params[:name])
  end
  
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :author, :blog_entry, :user_id, :image)
    end
end
