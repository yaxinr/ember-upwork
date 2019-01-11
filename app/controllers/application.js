import Route from '@ember/routing/route';
import { inject } from '@ember/service'

export default Route.extend({
  session: inject(),
  actions: {
    signIn: function(provider) {
      this.get('session').open('firebase', { provider: provider}).then(function(data) {
        console.log(data.currentUser);
      });
    },
    signOut: function() {
      this.get('session').close();
    }
  }
});