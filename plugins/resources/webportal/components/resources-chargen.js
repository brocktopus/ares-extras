import EmberObject from '@ember/object';
import Component from '@ember/component';

export default Component.extend({
    didInsertElement: function() {
      let self = this;
      this.set('updateCallback', function() { return self.onUpdate(); } );
    },
    onUpdate: function() {
      let extras = this.get('model.app.game.extra_plugins');
      if (!extras.any(e => e === 'resources')) {
        return {};
      }

      let data = {};
      this.get('model.char.resources').filter(t => t.name && t.name.length > 0)
         .forEach(t => data[t.name] = t.desc);
      return data;
    },
      
    actions: { 
        addResource() {
          this.get('model.char.resources').pushObject(EmberObject.create( {name: "Resource Name", desc: "Enter a Description"} ));
        },
        removeResource(name) {
          let found = this.get('model.char.resources').find(t => t.name === name);
          if (found) {
            this.get('model.char.resources').removeObject(found);  
          }
        }
    
    }
});
