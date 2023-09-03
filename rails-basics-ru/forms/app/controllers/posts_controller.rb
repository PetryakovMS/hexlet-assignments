class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # Flash сообщение
      # Сообщение рендерится в базовом шаблоне app/views/layouts/application.html.erb
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'New Task was successfully created'
      # Выполняется новый полноценный запрос

      redirect_to post_path(@post)
    else
      flash[:failure] = 'Task cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'Task was successfully updated'
      # Выполняется новый полноценный запрос
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Task cannot be updated'
      # Отрисовывается форма создания, все параметры остаются
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'task was successfully deleted'
      # Выполняется новый полноценный запрос

      redirect_to posts_path
    else
      flash[:failure] = 'task cannot be deleted'
      # Отрисовывается форма создания, все параметры остаются
      redirect_to root_path(@post)
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :summary, :published)
  end
end
