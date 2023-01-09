class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/day" do
    day = Day.all
    day.to_json
  end

  get '/tasks/:id' do
    task = Task.find(params[:id])
    task.to_json(include: :day)
  end

  get '/tasks' do
    tasks = Task.all
    tasks.to_json(include: :day)
  end

  post '/tasks' do
    tasks = Task.create(
      name: params[:name],
      day_id: params[:day_id]
    )
    tasks.to_json(include: :day)
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(
      name: params[:name],
      day_id: params[:day_id]
    )
    task.to_json(include: :day)
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json(include: :day)
  end

  # post '/tasks' do
  #   day = Day.find_by(day_of_week: params[:day][:day].downcase)
  #   category = Category.find_by(urgent: params[:category])
  #   task_to_add = Task.all.includes(:category, :day).create(
  #     description: params[:description][:formTask],
  #     category: category,
  #     day: day
  #   )
  #   # binding.pry
  #   task_to_add.to_json(:include => [:category, :day])
  # end

# get '/days' do
  #   # binding.pry
  #   day = Day.all
  #   day.to_json
  # end

  # get '/days/:id' do
  #   day = Day.find(params[:id])
  #   day.to_json
  # end

  # post '/days/:id' do
  #   day_to_add = Day.create(
  #     day_of_week: params[:day_of_week],
  #     # task_id: params[:task_id],
  #     # category_id: params[:category_id]
  #   )
  #   day_to_add.to_json
  # end

  # patch '/days/:id' do
  #   day_to_update = Day.find(params[:id])
  #   day_to_update.update(
  #     day_of_week: params[:day_of_week],
  #     # category_id: params[:category_id],
  #     # task_id: params[:task_id]
  #   )
  #   day_to_update.to_json
  # end

  # delete '/days/:id' do
  #   day_to_delete = Day.find(params[:id])
  #   day_to_delete.delete
  # end

end
