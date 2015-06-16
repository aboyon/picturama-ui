var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var less = require('gulp-less');
var path = require('path');
var minify_css = require('gulp-minify-css');
var runSequence = require('gulp-run-sequence');

gulp.task('compress_js', function() {
  return gulp.src(['assets/js/**/*.js'])
    .pipe(uglify())
    .pipe(concat('all.min.js'), {newLine: '\n\n'})
    .pipe(gulp.dest('public/assets'));
});

gulp.task('less', function () {
  return gulp.src('assets/less/bootstrap.less')
    .pipe(less({paths: ["."]}))
    .pipe(gulp.dest('assets/css'));
});

gulp.task('compress_css', function () {
  return gulp.src('assets/css/*.css')
    .pipe(minify_css({compatibility: 'ie8'}))
    .pipe(concat('all.min.css', {newLine: '\n\n'}))
    .pipe(gulp.dest('public/assets'));
});

gulp.task('compress_fonts', function () {
  gulp.src('assets/fonts/*.*').pipe(gulp.dest('public/fonts/'));
});

gulp.task('precompile:assets', function(s){
  runSequence('compress_js','less','compress_css','compress_fonts',s);
})