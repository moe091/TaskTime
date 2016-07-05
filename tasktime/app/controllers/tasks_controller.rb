class TasksController < ApplicationController
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    @duration = 1
    respond_with(@task)

  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(params[:task])
    @task.save
    respond_with(@task)
  end

  def update
    @task.update_attributes(params[:task])
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end


  def start_timer
    @duration = @duration
    @start = params[:start]
    @end = params[:end]
  end

  def create_session
    puts params
    puts "\n\n\n\n\nCREATE SESSION \n\n\n\n"
    @task = Task.find(params[:task_id])
    @session = Session.new(start: Time.at(params[:start].to_i), duration: params[:duration], end: Time.at(params[:end].to_i), note: params[:note])
    Task.find(params[:task_id]).sessions << @session
  end

  def show_sessions
    puts "\n\n\n\n\n\n\n SHOW SESSIONS \n\n\n\n\n\n"
    @task = Task.find(params[:id])
    render :partial => "sessions", :layout => false
  end


  private
    def set_task
      @task = Task.find(params[:id])
    end
end
