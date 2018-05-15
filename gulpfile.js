var gulp = require('gulp');
var scss = require('gulp-sass');
var dart = require('gulp-dart');


var PATHS = {
    scss: [/*TODO:*/],
    dart: [/*TODO:*/],
};


gulp.task('compile-scss', function () {
    return gulp.src(PATHS.scss)
               .pipe(scss({
                    /*TODO:*/
               }))
               .pipe(gulp.dest(function (file) {
                   return file.base.replace(//*TODO:*/$/, 'build');
                }));
});


gulp.task('compile-dart', function () {
    return gulp.src(PATHS.ts)
               .pipe(dart({
                    /*TODO:*/
               }))
               .pipe(gulp.dest(function (file) {
                   return file.base.replace(//*TODO:*/$/, 'build');
               }));
});


gulp.task('compile', function () {
    gulp.watch(PATHS.scss, gulp.series('compile-scss'));
    gulp.watch(PATHS.dart, gulp.series('compile-dart'));
});
