'use strict'

path = require('path')
gulp = require('gulp')
gutil = require('gulp-util')
jasmine = require('gulp-jasmine')
coffee = require('gulp-coffee')
concat = require('gulp-concat')
gulpif = require('gulp-if')
coffeelint = require('gulp-coffeelint')
uglify = require('gulp-uglify')


onError = (err) ->
  gutil.log gutil.colors.red("Error"), err.message
  this.emit 'end'

gulp.task 'coffeelint', ->
  gulp.src ['src/*.coffee','specs/*.coffee']
  .pipe coffeelint()
  .pipe coffeelint.reporter()

gulp.task 'test-build', ['coffeelint'], ->
  gulp.src ['src/*.coffee','spec/division_spec.coffee','spec/threeN_plus_1_spec.coffee','spec/substr_spec.coffee']
  .pipe coffee bare: true
  .on 'error', onError
  .pipe concat 'tests.js'
  .pipe gulp.dest 'build/'

gulp.task 'copy-libs', ->
  gulp.src ['libs/*.js']
  .pipe gulp.dest 'build/'

gulp.task 'test-runner', ['test-build'], ->
  gulp.src 'build/tests.js'
  .pipe jasmine()

gulp.task 'watcher', ->
  gulp.watch '**/*.coffee', ['test-runner']

gulp.task 'default', ['copy-libs', 'test-runner', 'watcher']

gulp.task 'build', ->
  gulp.src ['libs/*.js','src/*.coffee']
  .pipe gulpif /[.]coffee$/, coffee bare: true
  .pipe concat 'dist.js'
  .pipe uglify()
  .pipe gulp.dest 'build/'
  .on 'error', onError
