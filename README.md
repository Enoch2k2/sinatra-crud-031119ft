# Sinatra CRUD

### What is CRUD?
CRUD stands for Create, Read, Update, Delete. We use this interaction with our apps in order to handle records in our database.

### RESTful Routes and CRUD
CRUD and RESTful routes are often confused between the two terminologies.

As CRUD means to create, read, update, and delete. Restful routes consist of 7 routes:

 - Index   get '/todos' (Which renders a list of todos)
 - Show    get '/todos/:id' (Which renders one specific todo)
 - New     get '/todos/new' (Which renders a form to create a todo)
 - Create  post '/todos' (Which post data to the controller from the form to create the todo record)
 - Edit    get '/todos/:id/edit' (Renders an form to update a specific record)
 - Update  patch '/todos/:id' (patch request to the controller to update a todo record from the edit form)
 - Delete  delete '/todos/:id' (delete request to the controll to delete a todo record, usuall from a link or button)