class TodosController < ApplicationController
  get '/todos' do
    @todos = Todo.all
    erb :'todos/index'
  end

  get '/todos/new' do
    erb :'todos/new'
  end

  post '/todos' do
    todo = Todo.new(params)
    if todo.save
      redirect '/todos'
    else
      redirect '/todos/new'
    end
  end

  get '/todos/:id/edit' do
    @todo = Todo.find_by_id(params[:id])
    erb :'todos/edit'
  end

  get '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    erb :'todos/show'
  end

  patch '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    if @todo.update(title: params[:title], completed: params[:completed])
      redirect "/todos/#{@todo.id}"
    else
      redirect "/todos/#{@todo.id}/edit"
    end
  end

  delete '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    @todo.destroy
    redirect "/todos"
  end

end
