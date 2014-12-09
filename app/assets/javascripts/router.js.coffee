# For more information see: http://emberjs.com/guides/routing/

TodomvcRailsBackEnd.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'

TodomvcRailsBackEnd.TodosRoute = Ember.Route.extend
  model: -> @store.find('todo')

TodomvcRailsBackEnd.TodosIndexRoute = Ember.Route.extend
  setupController: -> @controllerFor('todos').set('filteredTodos', this.modelFor('todos'))

TodomvcRailsBackEnd.TodosActiveRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      !todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)

TodomvcRailsBackEnd.TodosCompletedRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)
