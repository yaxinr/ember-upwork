import EmberRouter from '@ember/routing/router'
import config from './config/environment'

Router = EmberRouter.extend(
  location: config.locationType
  rootURL: config.rootURL
)

Router.map ->
  @route 'products', ->
    @route 'item', path: '/:product_id', ->
      @route 'edit'
    @route 'new'

export default Router
