class TaskController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # Flash сообщение
      # Сообщение рендерится в базовом шаблоне app/views/layouts/application.html.erb
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'New Task was successfully created'
      # Выполняется новый полноценный запрос

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'Task was successfully updated'
      # Выполняется новый полноценный запрос

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      # Отрисовывается форма создания, все параметры остаются
      render :edit
    end

    puts @task.name
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'task was successfully deleted'
      # Выполняется новый полноценный запрос

      redirect_to root_path
    else
      flash[:failure] = 'task cannot be deleted'
      # Отрисовывается форма создания, все параметры остаются
      redirect_to task_path(@article)
    end
  end

  private

  def task_params
    # Требуем наличия ключа :article в params. Разрешаем использовать только некоторые ключи
    params.required(:task).permit(:name, :status, :creator, :description, :completed, :performer)
  end
end
