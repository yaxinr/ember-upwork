import Component from '@ember/component'
import { inject } from '@ember/service'

export default Component.extend
  firebaseApp: inject()
  router: inject()
  init: ->
    @_super arguments...
    @set 'modalVisible', true
  actions:
    save: (params) ->
      self = @
      @get 'model'
      .save()
      .then (product) ->
        self.get('router').transitionTo 'products.item', product
        self.set 'controllerErrorMessage', undefined
      , (reason) ->
        self.set 'controllerErrorMessage', reason.message
    discard: ->
      @get('router').transitionTo 'index'
    didSelectImage: (data) ->
      self = @
      storage = @get('firebaseApp').storage()
      storageRef = storage.ref()
      console.log(data)
      file = data
      id = @get 'model'
      .get 'id'
      uploadTask = storageRef.child('images/' + id).put file[0]
      uploadTask.on 'state_changed',
        (snapshot) ->
          progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          console.log('Upload is ' + progress + '% done');
          # self.set('progressText', `Upload is ${Math.round(progress * 100) / 100} % done`);
          self.set('progress', progress);
          # switch snapshot.state
          #   when storage.TaskState.PAUSED then self.set('status', 'Upload is paused')
          #   when storage.TaskState.RUNNING then self.set('status', 'Upload is running')
        , (error) ->
      , ->
        self.set 'model.image_url', uploadTask.snapshot.downloadURL

