import Route from '@ember/routing/route'
import { inject } from '@ember/service'

export default Route.extend
  session: inject(),
  beforeModel: ->
    if @get 'session.isAuthenticated'
      @transitionTo 'products.index'
    return
