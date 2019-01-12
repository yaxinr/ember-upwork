import Component from '@ember/component'
import { inject } from '@ember/service'

export default Component.extend
  store: inject()
  init: ->
    @_super arguments...
    @set 'model', @store.findAll 'product'
  actions:
    removeItem: (item) ->
      if confirm 'Are you sure you want to delete this product?'
        item.deleteRecord()
        item.save()
    searchByTitle: ->
      search_title = @get 'search_title'
      if search_title
        @set 'model', @store.query 'product',
          orderBy: 'title'
          equalTo: search_title
      else
        @set 'model', @store.findAll 'product'
