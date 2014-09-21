'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ThingSchema = new Schema({
  name: String,
  price: Number,
  added: Date,
  url: String,
  img: String
});

module.exports = mongoose.model('Thing', ThingSchema);
