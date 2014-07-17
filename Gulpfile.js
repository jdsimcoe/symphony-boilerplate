/*!
 * gulp
 * $ npm install gulp gulp-sass gulp-autoprefixer gulp-minify-css gulp-jshint gulp-concat gulp-uglify gulp-imagemin gulp-clean gulp-notify gulp-rename gulp-livereload gulp-cache node-neat --save-dev
 */

// Load plugins
var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    minifycss = require('gulp-minify-css'),
    jshint = require('gulp-jshint'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    rename = require('gulp-rename'),
    clean = require('gulp-clean'),
    concat = require('gulp-concat'),
    notify = require('gulp-notify'),
    cache = require('gulp-cache'),
    livereload = require('gulp-livereload'),
    neat = require('node-neat').includePaths,
    shell = require('gulp-shell');

// General information
var repo = 'https://github.com/',
    clientShort = 'string',
    localPassword = 'string',
    remotePassword = 'string',
    sshPort = 00000,
    sshServer = 'string',
    sqlDir = 'workspace/assets/_sql/';

// Styles
gulp.task('styles', function() {
  return gulp.src('workspace/assets/src/styles/main.scss')
    .pipe(sass( { includePaths: ['styles'].concat(neat) } ))
    .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(gulp.dest('public/dist/styles'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(minifycss())
    .pipe(gulp.dest('public/dist/styles'))
});

// Scripts
gulp.task('scripts', function() {
  return gulp.src('public/src/scripts/**/*.js')
    .pipe(jshint.reporter('default'))
    .pipe(concat('main.js'))
    .pipe(gulp.dest('public/dist/scripts'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(gulp.dest('public/dist/scripts'))
});

// Images
gulp.task('images', function() {
  return gulp.src('public/src/images/**/*')
    .pipe(cache(imagemin({ optimizationLevel: 3, progressive: true, interlaced: true })))
    .pipe(gulp.dest('public/dist/images'))
});

// Clean
gulp.task('clean', function() {
  return gulp.src(['public/dist/styles', 'public/dist/scripts', 'public/dist/images'], {read: false})
    .pipe(clean())
    .pipe(notify({
      "message": "Dist directories cleaned",
      "sound": "Hero",
      "open": repo
    }));
});

// Shell Scripts
gulp.task('backup', function () {
  return gulp.src('*.js', {read: false})
    .pipe(shell([
      'mysqldump ' + clientShort + ' -u root --password="' + localPassword + '" > ' + sqlDir + clientShort + '_local_$(date +%Y-%m-%d).sql',
      'ssh -p ' + sshPort + ' ' + sshServer + ' \ mysqldump -u ' + clientShort + ' --password="' + remotePassword + '" ' + clientShort + ' > ' + sqlDir + clientShort + '_live_$(date +%Y-%m-%d).sql'
    ]))
    .pipe(notify({
      "message": "SQL database backed up",
      "sound": "Hero",
      "open": repo
    }));
});

gulp.task('download', function () {
  return gulp.src('*.js', {read: false})
    .pipe(shell([
      'mysqldump ' + clientShort + ' -u root --password="' + localPassword + '" > ' + sqlDir + clientShort + '_local_$(date +%Y-%m-%d).sql',
      'ssh -p ' + sshPort + ' ' + sshServer + ' \ mysqldump -u ' + clientShort + ' --password="' + remotePassword + '" ' + clientShort + ' > ' + sqlDir + clientShort + '_live_$(date +%Y-%m-%d).sql',
      'mysql ' + clientShort + ' -u root --password="' + localPassword + '" < ' + sqlDir + clientShort + '_live_$(date +%Y-%m-%d).sql'
    ]))
    .pipe(notify({
      "message": "SQL database downloaded",
      "sound": "Hero",
      "open": repo
    }));
});

gulp.task('upload', function () {
  return gulp.src('*.js', {read: false})
    .pipe(shell([
      'mysqldump ' + clientShort + ' -u root --password="' + localPassword + '" > ' + sqlDir + clientShort + '_local_$(date +%Y-%m-%d).sql',
      'ssh -p ' + sshPort + ' ' + sshServer + ' \ mysqldump -u ' + clientShort + ' --password="' + remotePassword + '" ' + clientShort + ' > ' + sqlDir + clientShort + '_live_$(date +%Y-%m-%d).sql',
      'ssh -p ' + sshPort + ' ' + sshServer + ' \ mysql ' + clientShort + ' -u ' + clientShort + ' --password="' + remotePassword + '" ' + ' < ' + sqlDir + clientShort + '_local_$(date +%Y-%m-%d).sql'
    ]))
    .pipe(notify({
      "message": "SQL database uploaded",
      "sound": "Hero",
      "open": repo
    }));
});

// Default task
gulp.task('default', ['clean'], function() {
  gulp.start('styles', 'scripts', 'images', 'backup', 'watch');
});

// Watch
gulp.task('watch', function() {

  gulp.watch('public/src/styles/**/*.scss', ['styles']);
  gulp.watch('public/src/scripts/**/*.js', ['scripts']);
  gulp.watch('public/src/images/**/*', ['images']);
  var server = livereload();

  // Watch any files in dist/, reload on change
  gulp.watch(['public/dist/**']).on('change', function(file) {
    server.changed(file.path);
  });

});