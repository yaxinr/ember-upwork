import Route from '@ember/routing/route'

export default Route.extend
  model: ->
    @store.createRecord 'product'
  setupController: (controller, model) ->
    @_super controller, model
    controller.set 'modalVisible', true
