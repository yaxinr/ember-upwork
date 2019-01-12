import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'product-editor', 'Integration | Component | product-editor', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{product-editor}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#product-editor}}
      template block text
    {{/product-editor}}
  """

  assert.equal @$().text().trim(), 'template block text'
