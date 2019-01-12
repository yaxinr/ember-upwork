import Controller from '@ember/controller'
import { A } from '@ember/array'

export default Controller.extend
  actions:
    save: (params) ->
      self = @
      store = @get 'store'
      obj = @get 'model'
      .save()
      .then (product) ->
        self.transitionToRoute 'products.item', product
        self.set 'controllerErrorMessage', undefined
      , (reason) ->
        self.set 'controllerErrorMessage', reason.message
    discard: ->
      @transitionToRoute 'index'
