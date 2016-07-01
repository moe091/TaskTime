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

  def stop_timer
    #receive start, duration, end, task, and create session + add to task
    #puts "STOPPED"
    #puts "Duration: " + params[:duration]
    #puts "Start: " 
    #puts Time.at(params[:start].to_i)
    #puts "End: " 
    #puts Time.at(params[:end].to_i)
    #puts "Task: "
    #puts params[:task_id]
  end

  def create_session
    puts params
    @session = Session.new(start: Time.at(params[:start].to_i), duration: params[:duration], end: Time.at(params[:end].to_i), note: "Created with create session")
    @session.save();
    Task.find(params[:task_id]).sessions << @session
    puts @session
    puts @session.task_id
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
end
