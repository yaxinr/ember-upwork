import Route from '@ember/routing/route'

export default Route.extend
  redirect: ->
    @transitionTo 'products.index'
    return
  # model: ->
  #   @get 'store'
  #   .findAll 'product'
