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


### Rack MethodOverride Middleware
In order for us to get access to the httpverbs patch and delete you will need to add to the config.ru this line (above the lines where you have `use controllername` and `run application`)
```
use Rack::MethodOverride
```

Once we have this middleware applied, in our edit or delete forms we will override the method `"POST"` that we declared in the form tag with a hidden field. An example of this would like something like:
```
<form action="/todos/<%= @todo.id %>" method="POST">
  <input type="hidden" name="_method" value="patch">
  ... any other form html
</form>
```

Sinatra by default doesn't have PATCH or DELETE httpverbs. So for us override, we'd use the hidden inputs where the name attribute is set to _method declaring that this input is going to be overriding post, and value which is what we are overriding to.

When Sinatra identifies that param when it's submitted, it'll then match it to the route with that httpverb that's being requested. For example:
```
# TodosController

patch '/todos/:id' do
  # some logic here
end
```