import _ from 'lodash';

/**
 * Signature of Installer
 * install: func (required)
 * reinstall: func
 * uninstall: func (required)
*/
class Installer {
  constructor(config) {
    super();
    this.checkRequired(config, ['install', 'uninstall']);
    this.config = config;
  }
  checkRequired(obj, keys) {
    _.each(keys, key => {
      if(!_.has(obj, key)) return this.requiredError(obj, key);
    })
  }
  requiredError(obj, key) {
    throw new Error(`${key} is required!`)
  }
}

export default Installer;
