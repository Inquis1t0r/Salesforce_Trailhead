// todoItem.js
import { LightningElement } from 'lwc';
  ...
  nextHandler() {
    this.dispatchEvent(new CustomEvent('next'));
  }
}    
