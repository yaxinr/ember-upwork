import Route from '@ember/routing/route'

export default Route.extend
  model: ->
    @store.createRecord 'product'
