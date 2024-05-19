// todoApp.js
import { LightningElement } from 'lwc';
export default class TodoApp extends LightningElement {
  ... 
  nextHandler(){ 
    this.page = this.page + 1;
  }
} 
