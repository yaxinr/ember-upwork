import Controller from '@ember/controller'

export default Controller.extend
  actions:
    removeItem: (item) ->
      if confirm 'Are you sure you want to delete this product?'
        item.deleteRecord()
        item.save()
