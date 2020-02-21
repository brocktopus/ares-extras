import EmberObject from '@ember/object';
import Component from '@ember/component';

export default Component.extend({
    didInsertElement: function() {
      let self = this;
      this.set('updateCallback', function() { return self.onUpdate(); } );
    },
    onUpdate: function() {
      let extras = this.get('model.app.game.extra_plugins');
      if (!extras.any(e => e === 'skills')) {
        return {};
      }

      let data = {};
      this.get('model.char.skills').filter(t => t.name && t.name.length > 0)
         .forEach(t => data[t.name] = t.desc);
      return data;
    },
      
    actions: { 
        addSkill() {
          this.get('model.char.skills').pushObject(EmberObject.create( {name: "Skill Name", desc: "Enter a Description"} ));
        },
        removeSkill(name) {
          let found = this.get('model.char.skills').find(t => t.name === name);
          if (found) {
            this.get('model.char.skills').removeObject(found);  
          }
        }
    
    }
});
